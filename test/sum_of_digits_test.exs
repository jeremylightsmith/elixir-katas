#https://www.codewars.com/kata/541c8630095125aba6000c00/train/elixir
defmodule SumOfDigits do
  def digital_root(n) when n < 10, do: n
  def digital_root(n) do
    n
    |> Integer.digits
    |> Enum.sum
    |> digital_root
  end
end

defmodule SumOfDigitsTest do
  use ExUnit.Case

  test "16", do: assert SumOfDigits.digital_root(16) == 7
  test "456", do: assert SumOfDigits.digital_root(456) == 6
end