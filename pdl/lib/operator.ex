defmodule Operator do
  def execute_and(data) do
    [first_argument, second_argument] = load_arguments(data[:formula])

    data = Map.put(data, :formula, first_argument)
    current_vertices = Main.run(data)

    if (MapSet.size(current_vertices) > 0) do
      data = Map.put(data, :formula, second_argument)
      data = Map.put(data, :current_vertices, current_vertices)
      Main.run(data)
    else
      false
    end
  end

  def execute_or(data) do
    [first_argument, second_argument] = load_arguments(data[:formula])

    data_01 = Map.put(data, :formula, first_argument)
    data_02 = Map.put(data, :formula, second_argument)

    MapSet.union(Main.run(data_01), Main.run(data_02))
  end

  defp load_arguments(formula) do
    [FormulaHelper.get_argument_by_index(formula, 0), FormulaHelper.get_argument_by_index(formula, 1)]
  end
end
