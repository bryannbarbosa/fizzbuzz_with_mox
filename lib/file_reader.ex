defmodule FileReader do
  @behaviour FileReaderBehaviour
  def read(file_name) do
    File.read(file_name)
  end
end
