defmodule FileReaderTest do
  use ExUnit.Case, async: true

  describe "read/1" do
    test "returns message error when file does not exist" do
      assert {:error, :enoent} == FileReader.read("fake.txt")
    end
    test "returns with original numbers" do
      assert {:ok, "1,2,3,4\n"} == FileReader.read("test/fixtures/file.txt")
    end
  end
end
