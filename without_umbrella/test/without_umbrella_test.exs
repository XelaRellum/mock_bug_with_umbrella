defmodule WithoutUmbrellaTest do
  use ExUnit.Case
  doctest WithoutUmbrella

  test "greets the world" do
    assert WithoutUmbrella.hello() == :world
  end
end
