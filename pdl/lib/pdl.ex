defmodule Main do
  def run(data) do
    operator = data[:formula] |> String.at(0)
    cond do
      (operator == ";") -> Operator.execute_and(data)
      (operator == "U") -> Operator.execute_or(data)
      (operator == "*") -> IO.puts("Vou rodar o *")
      (true) -> GraphHelper.vertice_are_directly_connected?(data[:graph], data[:current_vertice], data[:formula])
    end
  end

  def parse_output(output) do
    unless output do
      "Fórmula NÃO satisfaz o grafpo"
    else
      "Fórmula satisfaz o grafo"
    end
  end
end

data = %{
  graph: InputData.get_graph(),
  formula: InputData.get_formula(),
  current_vertice: "X"
}

Main.run(data)
  |> Main.parse_output
  |> IO.puts
