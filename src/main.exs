defmodule Input do
  def graph do
    get_graph_string()
      |> parse_graph_string
  end

  def formula do
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

  defp read_file do
    file = File.read!("/home/lucas/Documents/personal_workspace/verif-frames-para-pdl-elixir/src/input.txt")
    File.close(file)
    file
  end

  defp parse_graph_string(graph_string) do
    graph_string
      |> String.split("|")
      |> Enum.map(fn(x) -> String.split(x, ",") end)
  end
end

Input.graph()
  |> IO.inspect
