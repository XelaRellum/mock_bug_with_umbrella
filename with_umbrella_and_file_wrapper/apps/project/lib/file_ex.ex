defmodule FileEx do
  def write_and_verify(path, content) do
    FileWrapper.write!(path, content)
    content === FileWrapper.read!(path)
  end
end
