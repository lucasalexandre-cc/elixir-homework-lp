defmodule Main do
  def run(data) do
    operator = data[:formula] |> String.at(0)
    cond do
      (operator == ";") -> Operator.execute_and(data)
      (operator == "U") -> Operator.execute_union(data)
      (operator == "*") -> IO.puts("Vou rodar o *")
      (true) -> GraphHelper.update_current_vertices(data[:graph], data[:current_vertices], data[:formula])
    end
  end

  def parse_output(output) do
    unless (MapSet.size(output) > 0) do
      "Fórmula NÃO satisfaz o grafpo"
    else
      "Fórmula satisfaz o grafo"
    end
  end
end

data = %{
  graph: InputData.get_graph(),
  formula: InputData.get_formula(),
  current_vertices: MapSet.new(["0"])
}

Main.run(data)
  |> Main.parse_output
  |> IO.puts
