defmodule FormulaHelper do
  def get_argument_by_index(formula, argument_index) do
    Regex.scan(~r/(?<=\().*(?=\))/, formula)
      |> Enum.at(0)
      |> Enum.at(0)
      |> String.graphemes
      |> Enum.reduce(["", 0], &magic_method/2)
      |> Enum.at(0)
      |> String.split("|")
      |> Enum.at(argument_index)
  end

  # Example of input/output
  # Input: ;(A,B),C
  # Output: ;(A,B)|C
  defp magic_method(x, acc) do
    current_string = Enum.at(acc, 0)
    parentheses_count = Enum.at(acc, 1)

    cond do
      (x == "," && parentheses_count == 0) ->
        current_string = current_string <> "|"
        List.replace_at(acc, 0, current_string)
      (x == "," && parentheses_count != 0) ->
        current_string = current_string <> x
        List.replace_at(acc, 0, current_string)
      (x == "(") ->
        current_string = current_string <> x
        parentheses_count = parentheses_count + 1
        acc = List.replace_at(acc, 0, current_string)
        List.replace_at(acc, 1, parentheses_count)
      (x == ")") ->
        current_string = current_string <> x
        parentheses_count = parentheses_count - 1
        acc = List.replace_at(acc, 0, current_string)
        List.replace_at(acc, 1, parentheses_count)
      (true) ->
        current_string = current_string <> x
        List.replace_at(acc, 0, current_string)
    end
  end
end
