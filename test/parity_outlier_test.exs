#https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/elixir
defmodule ParityOutlier do
  def find_outlier(integers) do
    sum_of_mods = integers
    |> Enum.take(3)
    |> Enum.map(fn i -> Integer.mod(i, 2) end)
    |> Enum.sum
    normal_mod = if sum_of_mods < 2 do 0 else 1 end
    Enum.find(integers, fn i -> Integer.mod(i, 2) != normal_mod end)
  end
end

defmodule ParityOutlierTest do
  use ExUnit.Case

  test "greets the world" do
    assert ParityOutlier.find_outlier([0,1,2]) == 1
    assert ParityOutlier.find_outlier([1,2,3]) == 2
    assert ParityOutlier.find_outlier([2,6,8,10,3]) == 3
    assert ParityOutlier.find_outlier([0,0,3,0,0]) == 3
    assert ParityOutlier.find_outlier([1,1,0,1,1]) == 0
  end
end

