defmodule Katas.Braces do
  @moduledoc false

  def open?(char) do
    case char do
      "(" -> true
      "{" -> true
      "[" -> true
      _ -> false
    end
  end

  def close(char) do
    case char do
      "(" -> ")"
      "{" -> "}"
      "[" -> "]"
      _ -> false
    end
  end

  def pop(stack) do
    [_ | new_stack] = stack
    new_stack
  end

  def push(stack, char) do
    [char | stack]
  end

  def valid_braces(braces) do
    {success, stack} = braces
                       |> String.graphemes
                       |> Enum.reduce(
                            {true, []},
                            fn (char, {success, stack}) ->
                              cond do
                                !success -> {false, stack}
                                open?(char) -> {true, push(stack, char)}
                                char == close(List.first(stack)) -> {true, pop(stack)}
                                true -> {false, stack}
                              end
                            end
                          )
    success && Enum.empty?(stack)
  end
end

