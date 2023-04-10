defmodule Eleetxir.Interviews.Compression do
  @moduledoc """
  Given an integer as a string, return a string that, when read aloud,
  describes how to write the integer from left to right, by stating
  how many of each number should be written and which number to write.

  For example, given the input “123”, the output should be “1 1 1 2 1 3”
  (read aloud, "one one, one two, one three"), while given the input “331123”,
  the output should be “2 3 2 1 1 2 1 3” (read aloud, "two three(s), two one(s), one two, one three").

  A space should be used to separate the count from the numbers and to separate
  each count-number pair from the next.

  Example Input and Output

    	Input: "123", Output: "1 1 1 2 1 3"

    	Input: "44877", Output: "2 4 1 8 2 7"

    	Input:  "9922555555", Output: "2 9 2 2 6 5"

    	Input:  "33233111", Output: "2 3 1 2 2 3 3 1"

    	Input: "0", Output: "1 0"

  """

  def convert_string(string) do
    [first | rest] = String.graphemes(string)

    tracker = %{current_value: first, count: 1}

    count_occurence(rest, tracker) |> List.to_string() |> String.trim_trailing()
  end

  defp count_occurence(numbers, tracker, acc \\ [])

  defp count_occurence([], tracker, acc) do
    Enum.reverse(update(tracker, acc))
  end

  defp count_occurence([first | rest] = _numbers, tracker, acc) do
    if first == tracker.current_value do
      updated_tracker = %{tracker | count: tracker.count + 1}
      count_occurence(rest, updated_tracker, acc)
    else
      updated_acc = update(tracker, acc)

      updated_tracker = %{tracker | current_value: first, count: 1}

      count_occurence(rest, updated_tracker, updated_acc)
    end
  end

  defp update(tracker, acc) do
    [tracker.current_value <> " " | [Integer.to_string(tracker.count) <> " " | acc]]
  end
end
