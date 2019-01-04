defmodule FileEx do
  def write_and_verify(path, content) do
    File.write!(path, content)
    content === File.read!(path)
  end
end
