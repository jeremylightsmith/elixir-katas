#https://www.codewars.com/kata/523f5d21c841566fde000009/train/elixir
defmodule ArrayDiff do
  def array_diff(a, b) do
    Enum.reject(a, & &1 in b)
    # Enum.reject(a, fn el -> el in b end)
  end
end

defmodule TestSolution do
  use ExUnit.Case

  test "Sample Tests" do
    assert ArrayDiff.array_diff([1, 2], [1]) == [2]
    assert ArrayDiff.array_diff([1, 2, 2], [1]) == [2, 2]
    assert ArrayDiff.array_diff([1, 2, 2], [2]) == [1]
    assert ArrayDiff.array_diff([1, 2, 2], []) == [1, 2, 2]
    assert ArrayDiff.array_diff([], [1, 2]) == []
  end
end