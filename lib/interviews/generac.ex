defmodule Interviews.Generac do
  @doc """
  PROMPT:
  similarity index: size of intersection/size of union

  e = [2, 3, 4, 5]
  f = [5, 8, 2, 9]

  expected output: 0.3333...

  output range: 0..1

  CLARIFICATION NOTES:
  intersection - which values appear in both lists
  union - combined lists, minus duplicates
  """
  def similarity_index([], []), do: 1

  def similarity_index(list_1, list_2) do
    if list_1 == [] || list_2 == [] do
      0
    else
      intersection_list =
        Enum.filter(list_1, fn num ->
          Enum.member?(list_2, num)
        end)

      whole_list = Enum.concat([list_1, list_2]) |> Enum.uniq()

      length(intersection_list) / length(whole_list)
    end
  end
end
