defmodule Eleetxir.Leetcode.ValidParenthesisStringTest do
  use ExUnit.Case

  alias Eleetxir.Leetcode.ValidParenthesisString

  describe "check_valid_string/1" do
    test "should return true if there are even opening and closing parens
      or the astericks can replace them to have no leftover parens" do
      assert true ==
               ValidParenthesisString.check_valid_string(
                 "((((()(()()()*()(((((*)()*(**(())))))(())()())(((())())())))))))(((((())*)))()))(()((*()*(*)))(*)()"
               )

      assert true == ValidParenthesisString.check_valid_string("(*))")
      assert true == ValidParenthesisString.check_valid_string()
    end

    test "should return false if there are leftover parens" do
      assert false == ValidParenthesisString.check_valid_string()
      assert false == ValidParenthesisString.check_valid_string()
      assert false == ValidParenthesisString.check_valid_string()
    end
  end
end
