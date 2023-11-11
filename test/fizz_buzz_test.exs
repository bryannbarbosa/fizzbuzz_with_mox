defmodule FizzBuzzTest do
  use ExUnit.Case, async: true
  import Mox

  setup :verify_on_exit!

  describe "build/1" do
    test "message error when file does not exist" do
      error_message = "Error in read file: enoent"

      FileReaderBehaviourMock |> expect(:read, fn _ -> {:error, :enoent} end)

      assert error_message == FizzBuzz.build("fake.txt")
    end
    test "returns a list with original numbers" do
      FileReaderBehaviourMock |> expect(:read, fn _ -> {:ok, "1,2,4"} end)

      assert FizzBuzz.build("fake.txt") == [1, 2, 4]
    end

    test "returns a list with :fizz when number divisible by 3" do
      FileReaderBehaviourMock |> expect(:read, fn _ -> {:ok, "1,2,3,6,7"} end)

      assert FizzBuzz.build("fake.txt") == [1, 2, :fizz, :fizz, 7]
    end

    test "returns a list with :buzz when number divisible by 5" do
      FileReaderBehaviourMock |> expect(:read, fn _ -> {:ok, "1,2,5,7"} end)

      assert FizzBuzz.build("fake.txt") == [1, 2, :buzz, 7]
    end

    test "returns a list with :fizzbuzz when number divisible by 5 and by 3" do
      FileReaderBehaviourMock |> expect(:read, fn _ -> {:ok, "1,2,7,15,30"} end)

      assert FizzBuzz.build("fake.txt") == [1, 2, 7, :fizzbuzz, :fizzbuzz]
    end

    test "returns a list with elements divisibles by 3, 5 and both" do
      FileReaderBehaviourMock |> expect(:read, fn _ -> {:ok, "1,2,3,5,15,30"} end)

      assert FizzBuzz.build("fake.txt") == [1, 2, :fizz, :buzz, :fizzbuzz, :fizzbuzz]
    end
  end
end
