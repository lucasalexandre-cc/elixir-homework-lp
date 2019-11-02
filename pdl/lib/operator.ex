defmodule Operator do
  def execute_and(data) do
    [first_argument, second_argument] = load_arguments(data[:formula])

    data = Map.put(data, :formula, first_argument)
    current_vertices = Main.run(data)
    failed = current_vertices && !Enum.reduce(current_vertices, fn x, acc -> x && acc end)

    if (current_vertices && length(current_vertices) > 0 && !failed) do
      data = Map.put(data, :formula, second_argument)
      data = Map.put(data, :current_vertices, current_vertices)
      current_vertices = Main.run(data)
      failed = current_vertices && !Enum.reduce(current_vertices, fn x, acc -> x && acc end)
      !failed && current_vertices
    else
      false
    end
  end

  def execute_union(data) do
    [first_argument, second_argument] = load_arguments(data[:formula])

    current_vertices_01 = Map.put(data, :formula, first_argument) |> Main.run
    current_vertices_02 = Map.put(data, :formula, second_argument) |> Main.run

    IO.inspect(current_vertices_01)
    IO.inspect(current_vertices_02)

    failed = (Enum.with_index(current_vertices_01)
                |> Enum.map(fn x -> Tuple.to_list(x) end)
                |> Enum.map(fn x -> Enum.at(x, 0) || Enum.at(current_vertices_02, Enum.at(x, 1))  end)
                |> Enum.filter(fn x -> !x end)
                |> length) > 0

    current_vertices_01 = Enum.map(current_vertices_01, fn x -> x || -1 end)
    current_vertices_02 = Enum.map(current_vertices_02, fn x -> x || -1 end)

    if(!failed) do
      current_vertices_01 ++ current_vertices_02
    else
      false
    end
  end

  defp load_arguments(formula) do
    [FormulaHelper.get_argument_by_index(formula, 0), FormulaHelper.get_argument_by_index(formula, 1)]
  end
end
