defmodule Eleetxir.Leetcode.MergeTripletsFindTargetTest do
  use ExUnit.Case

  alias Eleetxir.Leetcode.MergeTripletsFindTarget

  describe "merge_triplets/2" do
    test "returns true if target can be created from the list of triplets" do
      assert true ==
               MergeTripletsFindTarget.merge_triplets([[2, 5, 3], [1, 8, 4], [1, 7, 5]], [2, 7, 5])

      assert true ==
               MergeTripletsFindTarget.merge_triplets(
                 [[2, 5, 3], [2, 3, 4], [1, 2, 5], [5, 2, 3]],
                 [5, 5, 5]
               )

      assert true ==
               MergeTripletsFindTarget.merge_triplets([[2, 5, 3], [1, 7, 5], [1, 8, 4]], [2, 7, 5])
    end

    test "returns true if triplets only contains one triplet that matches target" do
      assert true == MergeTripletsFindTarget.merge_triplets([[2, 7, 5]], [2, 7, 5])
    end

    test "returns false if target cannot be created from the list of triplets" do
      refute true ==
               MergeTripletsFindTarget.merge_triplets([[5, 2, 3], [1, 8, 4], [1, 7, 5]], [2, 7, 5])

      refute true == MergeTripletsFindTarget.merge_triplets([[3, 4, 5], [4, 5, 6]], [3, 2, 5])
    end

    test "returns false if triplets only contains one triplet that doesn't match target" do
      refute true == MergeTripletsFindTarget.merge_triplets([[2, 9, 5]], [2, 7, 5])
    end
  end
end
