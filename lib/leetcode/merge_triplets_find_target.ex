defmodule Eleetxir.Leetcode.MergeTripletsFindTarget do
  @moduledoc """
  A triplet is an array of three integers.
  You are given a 2D integer array triplets, where triplets[i] = [ai, bi, ci] describes the ith triplet.
  You are also given an integer array target = [x, y, z] that describes the triplet you want to obtain.

  To obtain target, you may apply the following operation on triplets any number of times (possibly zero):

  Choose two indices (0-indexed) i and j (i != j) and update triplets[j] to become [max(ai, aj), max(bi, bj), max(ci, cj)].
  For example, if triplets[i] = [2, 5, 3] and triplets[j] = [1, 7, 5], triplets[j] will be updated to [max(2, 1), max(5, 7), max(3, 5)] = [2, 7, 5].
  Return true if it is possible to obtain the target triplet [x, y, z] as an element of triplets, or false otherwise.

  Example 1:
    Input: triplets = [[2,5,3],[1,8,4],[1,7,5]], target = [2,7,5]
    Output: true
    Explanation: Perform the following operations:
      - Choose the first and last triplets [[2,5,3],[1,8,4],[1,7,5]].
      Update the last triplet to be [max(2,1), max(5,7), max(3,5)] = [2,7,5].
      triplets = [[2,5,3],[1,8,4],[2,7,5]]
      The target triplet [2,7,5] is now an element of triplets.

  Example 2:
    Input: triplets = [[3,4,5],[4,5,6]], target = [3,2,5]
    Output: false
    Explanation: It is impossible to have [3,2,5] as an element because there is no 2 in any of the triplets.

  Example 3:
    Input: triplets = [[2,5,3],[2,3,4],[1,2,5],[5,2,3]], target = [5,5,5]
    Output: true
    Explanation: Perform the following operations:
      - Choose the first and third triplets [[2,5,3],[2,3,4],[1,2,5],[5,2,3]].
      Update the third triplet to be [max(2,1), max(5,2), max(3,5)] = [2,5,5].
      triplets = [[2,5,3],[2,3,4],[2,5,5],[5,2,3]].
      - Choose the third and fourth triplets [[2,5,3],[2,3,4],[2,5,5],[5,2,3]].
      Update the fourth triplet to be [max(2,5), max(5,2), max(5,3)] = [5,5,5].
      triplets = [[2,5,3],[2,3,4],[2,5,5],[5,5,5]].
      The target triplet [5,5,5] is now an element of triplets.
  """
  @spec merge_triplets(triplets :: [[integer]], target :: [integer]) :: boolean
  def merge_triplets(triplets, target) do
    counter = length(triplets) - 1

    compare_triplets(triplets, target, counter)
  end

  defp compare_triplets([last_triplet], target, 0) do
    target == last_triplet
  end

  defp compare_triplets([first_triplet | remaining], target, counter) do
    max_triplets = compare_values(first_triplet, remaining, target)

    cond do
      first_triplet == target ->
        true

      true in max_triplets ->
        true

      true ->
        compare_triplets(max_triplets, target, counter - 1)
    end
  end

  # defp compare_values(first_triplet, second_triplet, target) do
  #   Enum.zip([first_triplet, second_triplet, target])
  #   |> Enum.map(fn {first, second, target} ->
  #     cond do
  #       first == target -> target
  #       second == target -> target
  #       first >= second -> first
  #       true -> second
  #     end
  #   end)
  # end

  defp compare_values([a, b, c] = _first_triplet, remaining_triplets, target) do
    Enum.map(remaining_triplets, fn [x, y, z] ->
      max = [max(a, x), max(b, y), max(c, z)]

      if max == target,
        do: true,
        else: max
    end)
  end
end
