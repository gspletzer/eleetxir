defmodule Leetcode.EncodeDecodeTest do
  use ExUnit.Case

  import Leetcode.EncodeDecode

  describe "encode/1" do
    test "should return an encoded string that utilizes `;` as break points between elements from input list" do
      input = ["foo", "bar", "Test"]
      assert "Zm9v;YmFy;VGVzdA==;" == encode(input)
    end

    test "should return encoded string for non alpha characters" do
      input = ["4s6", "d@t3", "c*%@"]
      assert "NHM2;ZEB0Mw==;YyolQA==;" == encode(input)
    end
  end

  describe "decode/1" do
    test "should return a decoded list of strings" do
      input = "Zm9v;YmFy;VGVzdA==;"
      assert ["foo", "bar", "Test"] == decode(input)
    end

    test "should return decoded list of strings with non-alpha characters" do
      input = "NHM2;ZEB0Mw==;YyolQA==;"
      assert ["4s6", "d@t3", "c*%@"] == decode(input)
    end
  end

  describe "encode/1 + decode/1" do
    test "should return the original input once it completes a pass of encode and decode" do
      input = ["foo", "bar", "Test"]

      result = encode(input) |> decode()

      assert input == result
    end

    test "should return original input with non-alpha characters" do
      input = ["4s6", "d@t3", "c*%@"]

      result = encode(input) |> decode()

      assert input == result
    end
  end
end
