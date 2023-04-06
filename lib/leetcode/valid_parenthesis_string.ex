defmodule Eleetxir.Leetcode.ValidParenthesisString do
  @moduledoc """
  Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.

  The following rules define a valid string:

  - Any left parenthesis '(' must have a corresponding right parenthesis ')'.
  - Any right parenthesis ')' must have a corresponding left parenthesis '('.
  - Left parenthesis '(' must go before the corresponding right parenthesis ')'.
  - '*' could be treated as a single right parenthesis ')'
      or a single left parenthesis '(' or an empty string "".

  Example 1:
  Input: s = "()"
  Output: true

  Example 2:
  Input: s = "(*)"
  Output: true

  Example 3:
  Input: s = "(*))"
  Output: true

  Constraints:
    1 <= s.length <= 100
    s[i] is '(', ')' or '*'.
  """

  @spec check_valid_string(s :: String.t()) :: boolean
  def check_valid_string(s) do
    parens_list = String.graphemes(s)
    min_max = {0, 0}

    evaluate_parens(parens_list, min_max)
  end

  defp evaluate_parens([], {min, max} = _min_max) do
    min === 0
  end

  defp evaluate_parens([first | rest], {min, max} = _min_max) do
    {new_min, new_max} =
      cond do
        first == "(" -> {min + 1, max + 1}
        first == ")" -> {min - 1, max - 1}
        true -> {min - 1, max + 1}
      end

    if new_max < 0,
      do: false,
      else: evaluate_parens(rest, {max(new_min, 0), new_max})
  end
end
