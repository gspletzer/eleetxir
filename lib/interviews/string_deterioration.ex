defmodule Interviews.StringDeterioration do
  @moduledoc """
  From a given string, iterate 26 times removing all occurrences
  of a particular alpha character with each pass and returning the
  updated string to a result list that will be returned at the end
  of all iterations. Final element in the result list should be a
  string with only spaces and punctuation.

  EXAMPLE:
  Input = "The lazy dog jumped over the fat cat; the fly just buzzed around."
  Final element of result array = "        ;     ."
  """

  @doc """
  Removes all occurrences of given alpha character and adds reduced string
  to the accumulator. Returns the accumulator where the final element
  contains only spaces and punctuation from original input. Reduced strings
  need to maintain capitalization.
  """
  def remove_characters(string) do
    letters = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z) |> Enum.shuffle()

    Enum.reduce(letters, [string], fn letter, acc ->
      reduced =
        String.replace(Enum.at(acc, 0), String.downcase(letter), "")
        |> String.replace(String.upcase(letter), "")

      [reduced | acc]
    end)
    |> List.first()
  end

  @doc """
  Returns a string with all alpha characters removed incrementally.
  """
  def reduce_string(string) do
    letters = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z) |> Enum.shuffle()

    Enum.reduce(letters, string, fn letter, acc ->
      String.replace(acc, String.downcase(letter), "")
      |> String.replace(String.upcase(letter), "")
    end)
  end
end
