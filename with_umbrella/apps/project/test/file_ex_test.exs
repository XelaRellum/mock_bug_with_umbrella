defmodule FileExTest do
  use ExUnit.Case

  import Mock

  @moduledoc """
  We use mock with an Agent to simulate the filesystem and store data
  """

  setup do
    {:ok, agent} = Agent.start_link(fn -> %{} end)

    %{
      write!: fn path, content ->
        Agent.update(agent, fn filesystem -> Map.put(filesystem, path, content) end)
      end,
      read!: fn path ->
        Agent.get(agent, fn filesystem -> Map.get(filesystem, path) end)
      end
    }
  end

  describe "write_and_verify/1" do
    test "successful operation", mocks do
      with_mock(File, [
        write!: mocks.write!,
        read!: mocks.read!
      ]) do
        assert FileEx.write_and_verify("some path", "som content") == true
      end
    end

    test "unsuccessful read", mocks do
      with_mock(File, [
        write!: mocks.write!,
        read!: fn _path -> "" end
      ]) do
        assert FileEx.write_and_verify("some path", "som content") == false
      end
    end

  end
end
