defmodule Interviews.Reverence do
  # list + n, returns randomm selection from list selection =n
  @doc """
  Criteria: construct a function that take a list of elements
  and integer (n) and returns a new list with length of n that
  contains random elements from original list.

  This version utilizes pattern matching and recursion. Biggest
  time cost will be with List.pop_at, due to the nature of linked
  list.
  """
  def random(list, n) do
    get_random(list, [], n)
  end

  def get_random(list, output \\ [], n)

  def get_random(_list, output, 0), do: output

  def get_random(list, output, n) do
    num = Enum.random(0..(length(list) - 1))

    {selected, new_list} = List.pop_at(list, num)

    get_random(new_list, [selected | output], n - 1)
  end

  @doc """
  This version is less verbose, but would be time heavy with shuffle
  for larger lists.
  """

  def shuffle(list, n) do
    list
    |> Enum.shuffle()
    |> Enum.take(n)
  end
end
