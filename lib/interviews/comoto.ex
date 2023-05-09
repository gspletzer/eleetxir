defmodule Interviews.Comoto do
  @moduledoc """
  Task:
   - Print out 1-100
   - when divisible by 3 = fizz
   - when divisible by 5 = buzz
   - when divisible by both 5 & 3 = fizzbuzz

  All outputs are strings

  Task update:
   - Change range to 7-120
   - Add additional outputs:
    - when divisible by 7 = pop
    - when divisible by 7 & 5 = buzzpop
    - when divisible by 7 & 3 = fizzpop
    - when divisble by 7, 5, & 3 = pizza party!
  """

  @spec print_range(start :: integer(), stop :: integer()) :: :ok
  def print_range(start, stop) do
    Enum.to_list(start..stop)
    |> Enum.each(fn num -> fizzbuzz(num) end)
  end

  def fizzbuzz(num) do
    cond do
      rem(num, 7) == 0 && rem(num, 5) == 0 && rem(num, 3) == 0 ->
        IO.write("pizza party!")

      rem(num, 7) == 0 && rem(num, 5) == 0 ->
        IO.write("buzzpop")

      rem(num, 7) == 0 && rem(num, 3) == 0 ->
        IO.write("fizzpop")

      rem(num, 5) == 0 && rem(num, 3) == 0 ->
        IO.write("fizzbuzz")

      rem(num, 7) == 0 ->
        IO.write("pop")

      rem(num, 5) == 0 ->
        IO.write("buzz")

      rem(num, 3) == 0 ->
        IO.write("fizz")

      true ->
        string = Integer.to_string(num)
        IO.write(string)
    end
  end
end
