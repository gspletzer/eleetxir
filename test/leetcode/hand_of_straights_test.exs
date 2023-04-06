defmodule Eleetxir.Leetcode.HandofStraightsTest do
  use ExUnit.Case

  alias Eleetxir.Leetcode.HandOfStraights

  describe "is_n_straight/2" do
    test "returs true when the hand can be broken into consectutive groups
    without any cards remaining" do
      assert true == HandOfStraights.is_n_straight_hand([1, 2, 3, 6, 2, 3, 4, 7, 8], 3)
    end

    # test "returns false when the hand "
  end
end
