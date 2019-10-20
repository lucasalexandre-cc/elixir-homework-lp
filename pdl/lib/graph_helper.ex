defmodule GraphHelper do
  def update_current_vertices(graph, current_vertices, edge) do
    Enum.map(current_vertices, fn vertice -> update_vertice(graph, vertice, edge) end)
      |> Enum.filter(fn x -> !!x end)
      |> MapSet.new
  end

  defp update_vertice(graph, vertice, edge) do
    result = Enum.find(graph, fn e -> Enum.at(e, 0) == vertice && Enum.at(e, 2) == edge end)
    result && Enum.at(result, 1)
  end
end
