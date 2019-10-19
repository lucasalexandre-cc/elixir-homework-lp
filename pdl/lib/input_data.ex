defmodule InputData do
  def get_graph do
    get_graph_string()
      |> parse_graph_string
  end

  def get_formula do
    get_formula_string()
  end

  defp get_graph_string do
    read_file()
      |> String.split("\n")
      |> Enum.at(0)
  end

  defp get_formula_string do
    read_file()
      |> String.split("\n")
      |> Enum.at(1)
  end

  defp parse_graph_string(graph_string) do
    graph_string
      |> String.split("|")
      |> Enum.map(fn(x) -> String.split(x, ",") end)
  end

  defp read_file do
    file = Path.absname("assets/#{file_name()}") |> File.read!
    File.close(file)
    file
  end

  defp file_name do
    System.argv()
  end
end
