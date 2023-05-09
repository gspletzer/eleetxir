defmodule Interviews.ComotoTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Interviews.Comoto

  describe "print_range/2" do
    test "should return outputs for given range and :ok" do
      assert capture_io(fn -> print_range(1, 15) end) ==
               "12fizz4buzzfizzpop8fizzbuzz11fizz13popfizzbuzz"
    end
  end

  describe "fizzbuzz/1" do
    test "should return fizz when only divisible by 3" do
      assert capture_io(fn -> fizzbuzz(3) end) == "fizz"
      assert capture_io(fn -> fizzbuzz(66) end) == "fizz"
    end

    test "should return buzz when only divisible by 5" do
      assert capture_io(fn -> fizzbuzz(5) end) == "buzz"
      assert capture_io(fn -> fizzbuzz(100) end) == "buzz"
    end

    test "should return fizzbuzz when divisible by 3 & 5" do
      assert capture_io(fn -> fizzbuzz(15) end) == "fizzbuzz"
      assert capture_io(fn -> fizzbuzz(45) end) == "fizzbuzz"
    end

    test "should return pop when only divisible by 7" do
      assert capture_io(fn -> fizzbuzz(7) end) == "pop"
      assert capture_io(fn -> fizzbuzz(49) end) == "pop"
    end

    test "should return fizzpop when divisible by 3 & 7" do
      assert capture_io(fn -> fizzbuzz(21) end) == "fizzpop"
      assert capture_io(fn -> fizzbuzz(63) end) == "fizzpop"
    end

    test "should return buzzpop when divisible by 7 & 5" do
      assert capture_io(fn -> fizzbuzz(35) end) == "buzzpop"
      assert capture_io(fn -> fizzbuzz(70) end) == "buzzpop"
    end

    test "should return pizza party! when divisible by 3, 7 & 5" do
      assert capture_io(fn -> fizzbuzz(105) end) == "pizza party!"
      assert "pizza party!"
    end

    test "should return the string of given number when not divisible by 3, 7 & 5" do
      assert capture_io(fn -> fizzbuzz(2) end) == "2"
      assert capture_io(fn -> fizzbuzz(47) end) == "47"
    end
  end
end
