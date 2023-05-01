defmodule Interviews.ComotoTest do
  import Interviews.Comoto

  describe "fizzbuzz/1" do
    test "should return fizz when number is divisible by 3 and buzz when divisible by 5" do
      assert "fizz" == fizzbuzz(3)
      assert "buzz" == fizzbuzz(5)
      assert "fizzbuzz" == fizzbuzz(15)
      assert "2" == fizzbuzz(2)
      assert "pop" == fizzbuzz(7)
      assert "fizzpop" == fizzbuzz(21)
      assert "buzzpop" == fizzbuzz(35)
      assert "pizza party!" == fizzbuzz(105)
    end
  end
end
