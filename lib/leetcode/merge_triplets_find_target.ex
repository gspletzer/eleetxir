defmodule Eleetxir.Leetcode.MergeTripletsFindTarget do
  @moduledoc """
  A triplet is an array of three integers.
  You are given a 2D integer array triplets, where triplets[i] = [ai, bi, ci] describes the ith triplet.
  You are also given an integer array target = [x, y, z] that describes the triplet you want to obtain.

  To obtain target, you may apply the following operation on triplets any number of times (possibly zero):

  Choose two indices (0-indexed) i and j (i != j) and update triplets[j] to become [max(ai, aj), max(bi, bj), max(ci, cj)].
  For example, if triplets[i] = [2, 5, 3] and triplets[j] = [1, 7, 5], triplets[j] will be updated to [max(2, 1), max(5, 7), max(3, 5)] = [2, 7, 5].
  Return true if it is possible to obtain the target triplet [x, y, z] as an element of triplets, or false otherwise.
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
    if first_triplet != target do
      [second_triplet | unevaluated] = remaining

      new_triplet = compare_values(first_triplet, second_triplet, target)

      compare_triplets([new_triplet | unevaluated], target, counter - 1)
    else
      true
    end
  end

  defp compare_values(first_triplet, second_triplet, target) do
    Enum.zip([first_triplet, second_triplet, target])
    |> Enum.map(fn {first, second, target} ->
      cond do
        first == target -> target
        second == target -> target
        first >= second -> first
        true -> second
      end
    end)
  end
end
