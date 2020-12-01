#https://www.codewars.com/kata/5541f58a944b85ce6d00006a/train/elixir
defmodule ProdFib do
  def product_fib(n, a \\ 0, b \\ 1)

  def product_fib(n, a, b) when n <= a * b, do: [a, b, n == a * b]
  def product_fib(n, a, b), do: product_fib(n, b, a + b)

  #  def product_fib(product, n, m) do
  #    cond do
  #      n * m == product -> [n, m, true]
  #      n * m > product -> [n, m, false]
  #      true -> product_fib(product, m, n+m)
  #    end
  #  end
end

ExUnit.start

defmodule ProdFibTest do
  use ExUnit.Case

  def dotest(n, exp) do
    IO.puts("Testing : #{n}")
    act = ProdFib.product_fib(n)
    IO.puts "#{inspect(act)}"
    IO.puts "#{inspect(exp)}"
    assert act == exp
    IO.puts("#")
  end

  test "product_fib" do
    dotest(4895, [55, 89, true])
    dotest(5895, [89, 144, false])
    dotest(74049690, [6765, 10946, true])
  end
end
