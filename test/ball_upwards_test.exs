#https://www.codewars.com/kata/566be96bb3174e155300001b/train/elixir
defmodule BallUpdwards do
  @gravity 9.81 # m/s
  @meters_per_km 1000
  @seconds_per_hour 60 * 60

  def max_ball(v0_in_km_per_hr) do
    velocity = v0_in_km_per_hr * @meters_per_km / @seconds_per_hour
    Stream.unfold(
      {0, 0},
      fn {height, time} ->
        new_height = velocity * time - @gravity * time * time / 2
        if new_height < height do
          nil
        else
          {round(time * 10), {new_height, time + 0.1}}
        end
      end
    )
    |> Enum.to_list
    |> List.last
  end
end

defmodule BallUpdwardsTest do
  use ExUnit.Case

  defp testing(numtest, v0, ans) do
    IO.puts("Test #{numtest}")
    assert BallUpdwards.max_ball(v0) == ans
  end

  test "max_ball" do
    testing(1, 37, 10)
    testing(2, 45, 13)
    testing(3, 99, 28)
    testing(4, 85, 24)
  end
end
