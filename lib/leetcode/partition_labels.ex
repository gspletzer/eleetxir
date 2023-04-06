defmodule Eleetxir.Leetcode.PartitionLabels do
  @moduledoc """
  You are given a string s.
  We want to partition the string into as many parts as possible
  so that each letter appears in at most one part.

  Note that the partition is done so that after concatenating all the parts in order,
  the resultant string should be s.

  Return a list of integers representing the size of these parts.

  Example 1:
    Input: s = "ababcbacadefegdehijhklij"
    Output: [9,7,8]
    Explanation:
    The partition is "ababcbaca", "defegde", "hijhklij".
    This is a partition so that each letter appears in at most one part.
    A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.

  Example 2:
    Input: s = "eccbbbbdec"
    Output: [10]


  Constraints:
    1 <= s.length <= 500
    s consists of lowercase English letters.
  """

  @spec partition_labels(s :: String.t()) :: [integer]
  def partition_labels(s) do
    # each partition will contain the first and last occurence of particular character
    # map character with index of first and last occurence
    # then check for overlaps to determine slice points for generating partions.
    # map with first and last index
    # iterate through string to establish slice point
    # when you hit a character that doesn’t extend the end point
    # or index of iteration equals slice end point, then slice and begin new slice

    s_list = String.graphemes(s)
    range = Enum.list(1..length(s_list))

    index_map = %{}

    Enum.every(s_list, fn x ->
      Map.put(index_map)
    end)

    # make a map with last index of each character
    # make a range equal to length; will be range value -1 to assess what value
    # is at that index for string list and see
    # - if beginning value is less than current max(last index);
    # - if last value is less than current max(last index)
    # - if beginning value less than current max but last value is greater, change max
    # - when last value equals max- return that slice point
  end
end

# in javascript:
# let last = -1
# const res = []
# let left = 0

# for(let i=0, i<s.length; i++){
#   last =Math.max(s.lastindexof(s[i]), last)
#   if (i===last {
#     res.push(i-left+1);
#     left=i+1
#   })
# }
