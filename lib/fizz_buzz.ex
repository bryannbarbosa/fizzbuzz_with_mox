defmodule FizzBuzz do
  def build(file_name) do
    Application.get_env(:fizz_buzz, :file_reader).read(file_name)
    |> handle_file_read
  end

  defp handle_file_read({:ok, result}) do
    String.split(result, ",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&convert_and_evaluate_numbers/1)
  end
  defp handle_file_read({:error, reason}), do: "Error in read file: #{reason}"

  defp convert_and_evaluate_numbers(number) do
    number
    |> String.to_integer
    |> evaluate_numbers
  end

  defp evaluate_numbers(number) when rem(number, 15) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz

  defp evaluate_numbers(number), do: number
end
