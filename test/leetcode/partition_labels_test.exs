defmodule Eleetxir.Leetcode.PartitionLabelsTest do
  use ExUnit.Case

  alias Eleetxir.Leetcode.PartitionLabels

  describe "partition_labels/1" do
    test "should return list of integers that contain lengths of all partitions" do
      assert [9, 7, 8] == PartitionLabels.partion_labels("ababcbacadefegdehijhklij")
      assert [10] == PartitionLabels.partion_labels("eccbbbbdec")
    end
  end
end
