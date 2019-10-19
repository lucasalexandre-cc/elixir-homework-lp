defmodule GraphHelper do
  def vertice_are_directly_connected?(graph, current_vertice, check_vertice) do
    result = Enum.find(graph, fn e -> Enum.at(e, 0) == current_vertice && Enum.at(e, 1) == check_vertice end)
    #IO.puts("##########")
    #IO.puts(current_vertice)
    #IO.puts(check_vertice)
    result && Enum.at(result, 1)
  end
end
