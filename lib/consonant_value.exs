defmodule Kata do
  def solve(s) do
    # your code here
    0
  end
end

ExUnit.start

defmodule TestSuite do
  use ExUnit.Case

  def test_run(s,sol), do: assert Kata.solve(s) == sol

  test "zodiac" do test_run("zodiac", 26) end
  test "chruschtschov" do test_run("chruschtschov", 80) end
  test "khrushchev" do test_run("khrushchev", 38) end
  test "strength" do test_run("strength", 57) end
  test "catchphrase" do test_run("catchphrase", 73) end
  test "twelfthstreet" do test_run("twelfthstreet", 103) end
  test "mischtschenkoana" do test_run("mischtschenkoana", 80) end
end