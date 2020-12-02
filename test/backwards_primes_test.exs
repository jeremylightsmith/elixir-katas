#https://www.codewars.com/kata/5539fecef69c483c5a000015/train/elixir
defmodule BackwardsPrimes do
  def backwards_prime(start, stop) do
    start..stop
    |> Enum.filter(&prime?/1)
    |> Enum.filter(&backwards_prime?/1)
  end

  def backwards_prime?(number) do
    reversed = number |> Integer.digits |> Enum.reverse |> Integer.undigits
    number != reversed && prime?(reversed)
  end

  def prime?(number) when number < 2, do: false
  def prime?(number) when number == 2, do: true
  def prime?(number) do
    2..round(:math.sqrt(number))
    |> Enum.any?(fn factor -> Integer.mod(number, factor) == 0 end)
    |> Kernel.not
  end
end

defmodule BackwardsPrimesTest do
  use ExUnit.Case
  import BackwardsPrimes

  def testing(start, stop, exp) do
    IO.puts("Testing : #{start} #{stop}")
    act = BackwardsPrimes.backwards_prime(start, stop)
    IO.puts "actual #{inspect(act)}"
    IO.puts "expect #{inspect(exp)}"
    assert act == exp
    IO.puts("#")
  end

  test "prime?" do
    assert prime?(0) == false
    assert prime?(1) == false
    assert prime?(2) == true
    assert prime?(3) == true
    assert prime?(4) == false
    assert prime?(5) == true
    assert prime?(6) == false
    assert prime?(7) == true
    assert prime?(8) == false
    assert prime?(9) == false
    assert prime?(10) == false
    assert prime?(11) == true
    assert prime?(17) == true
    assert prime?(49) == false
    assert prime?(53) == true
  end

  test "backwards_prime" do
    a = [13, 17, 31, 37, 71, 73, 79, 97]
    testing(1, 100, a)
    a = [13, 17, 31]
    testing(1, 31, a)
    a = []
    testing(501, 599, a)
    a = []
    testing(430596, 431935, a)
  end
end