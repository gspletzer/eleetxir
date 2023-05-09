defmodule Interviews.ReverenceTest do
  use ExUnit.Case

  alias Interviews.Reverence

  describe "random/2" do
    test "should return a random n selection of elements from input list" do
      list = Enum.to_list(1..10)
      n = 3

      result = Reverence.random(list, n)

      assert length(result) == n
      assert Enum.random(result) in list
    end
  end

  describe "shuffle/2" do
    test "should return a random n selection of elements from input list" do
      list = Enum.to_list(1..10)
      n = 3

      result = Reverence.shuffle(list, n)

      assert length(result) == n
      assert Enum.random(result) in list
    end
  end
end
