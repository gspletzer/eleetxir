defmodule Interviews.GeneracTest do
  use ExUnit.Case

  import Interviews.Generac

  test "returns decimal value for partial similarity index" do
    e = [2, 3, 4, 5]
    f = [5, 8, 2, 9]

    result = 1 / 3

    assert result == similarity_index(e, f)
  end

  test "returns zero + decimal when there is no similarity index between two lists" do
    g = [5, 8, 2, 9]
    h = [1, 3, 12, 7]

    result = 0 / 8

    assert result == similarity_index(g, h)
  end

  test "returns zero when one list is empty" do
    g = [5, 8, 2, 9]

    assert 0 == similarity_index(g, [])
    assert 0 == similarity_index([], g)
  end

  test "returns 1 when both lists are empty" do
    assert 1 == similarity_index([], [])
  end
end
