defmodule FileReaderBehaviour do
  @callback read(String.t()) :: {:ok, String.t()} | {:error, String.t()}
end
