defmodule FileWrapper do
  def write!(path, content), do: File.write!(path, content)
  def read!(path), do: File.read!(path)
end
