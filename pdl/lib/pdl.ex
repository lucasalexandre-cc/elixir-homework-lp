defmodule Main do
  def run(data) do
    operator = data[:formula] |> String.at(0)
    cond do
      (operator == ";") -> Operator.execute_and(data)
      (operator == "U") -> Operator.execute_union(data)
      (operator == "*") -> Operator.execute_asteristico(data)
      (true) -> GraphHelper.update_current_vertices(data[:graph], data[:current_vertices], data[:formula])
    end
  end

  def parse_output(output) do
    unless (output && length(output) > 0) do
      "Fórmula NÃO satisfaz o grafpo"
    else
      "Fórmula satisfaz o grafo"
    end
  end
end

data = %{
  graph: InputData.get_graph(),
  formula: InputData.get_formula(),
  current_vertices: ["0"]
}

Main.run(data)
  |> Main.parse_output
  |> IO.puts
