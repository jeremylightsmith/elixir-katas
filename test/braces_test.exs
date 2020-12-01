defmodule Katas.BracesTest do
  use ExUnit.Case
  import Katas.Braces

  test "greets the world" do
    assert valid_braces("()") == true
    assert valid_braces("(") == false
    assert valid_braces("({})") == true
    assert valid_braces("({)") == false

    assert valid_braces("(){}[]") == true
    assert valid_braces("([{}])") == true
    assert valid_braces("(}") == false
    assert valid_braces("[(])") == false
    assert valid_braces("[({})](]") == false
  end
end
