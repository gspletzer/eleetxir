defmodule Interviews.StringDeteriorationTest do
  use ExUnit.Case

  import Interviews.StringDeterioration

  describe "remove_characters/1" do
    test "should return a list of reduced strings, with last element only containing spaces and punctuation" do
      result = remove_characters("Hello, Ted Lasso!")

      assert ",  !" == result
    end
  end

  describe "reduce_string/1" do
    test "should return a string that only contains spaces and punctuation" do
      result = reduce_string("Hello, Wonder kid!")

      assert ",  !" == result
    end
  end
end
