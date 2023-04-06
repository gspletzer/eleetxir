defmodule Eleetxir.Leetcode.HandOfStraights do
  @moduledoc """
  Alice has some number of cards and she wants to rearrange the cards into groups
  so that each group is of size groupSize, and consists of groupSize consecutive cards.

  Given an integer array hand where hand[i] is the value written on the ith card
  and an integer groupSize, return true if she can rearrange the cards, or false otherwise.

  Example 1:
    Input: hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
    Output: true
    Explanation: Alice's hand can be rearranged as [1,2,3],[2,3,4],[6,7,8]

  Example 2:
    Input: hand = [1,2,3,4,5], groupSize = 4
    Output: false
    Explanation: Alice's hand can not be rearranged into groups of 4.
  """
  @spec is_n_straight_hand(hand :: [integer], group_size :: integer) :: boolean
  def is_n_straight_hand(hand, group_size) do
    if is_divisible?(length(hand), group_size) do
      sorted_hand = Enum.sort(hand)
      group_range = Enum.to_list(1..(group_size - 1))
      check_hand(sorted_hand, group_range, group_size)
    else
      false
    end
  end

  defp check_hand([], _group_range, _group_size), do: true

  defp check_hand([first_card | remaining], group_range, group_size) do
    next_values = Enum.map(group_range, fn x -> x + first_card end)
    hand = remaining -- next_values

    if is_divisible?(length(hand), group_size) do
      check_hand(hand, group_range, group_size)
    else
      false
    end
  end

  defp is_divisible?(length, size), do: rem(length, size) == 0
end
