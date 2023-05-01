defmodule Interviews.ComotoTest do
  import ExUnit.CaptureIO
  import Interviews.Comoto

  describe "print_range/2" do
    test "should return outputs for given range and :ok" do
      execute_print = print_range(1, 15)

      assert :ok == execute_print
      assert capture_io(execute_print) == "1 2 fizz 4 buzz 6 7 8 fizz buzz 11 fizz 13 14 fizzbuzz"
    end
  end

  describe "fizzbuzz/1" do
    test "should return fizz when only divisible by 3" do
      assert "fizz" == fizzbuzz(3)
      assert "fizz" == fizzbuzz(66)
    end

    test "should return buzz when only divisible by 5" do
      assert "buzz" == fizzbuzz(5)
      assert "buzz" == fizzbuzz(100)
    end

    test "should return fizzbuzz when divisible by 3 & 5" do
      assert "fizzbuzz" == fizzbuzz(15)
      assert "fizzbuzz" == fizzbuzz(45)
    end

    test "should return pop when only divisible by 7" do
      assert "pop" == fizzbuzz(7)
      assert "pop" == fizzbuzz(49)
    end

    test "should return fizzpop when divisible by 3 & 7" do
      assert "fizzpop" == fizzbuzz(21)
      assert "fizzpop" == fizzbuzz(63)
    end

    test "should return buzzpop when divisible by 7 & 5" do
      assert "buzzpop" == fizzbuzz(35)
      assert "buzzpop" == fizzbuzz(70)
    end

    test "should return pizza party! when divisible by 3, 7 & 5" do
      assert "pizza party!" == fizzbuzz(105)
      assert "pizza party!" == fizzbuzz(945)
    end

    test "should return the string of given number when not divisible by 3, 7 & 5" do
      assert "2" == fizzbuzz(2)
      assert "47" == fizzbuzz(47)
    end
  end
end
