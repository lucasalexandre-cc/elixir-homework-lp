defmodule Operator do
  def execute_and(data) do
    formula = data[:formula]
    first_argument = FormulaHelper.get_argument_by_index(formula, 0)
    second_argument = FormulaHelper.get_argument_by_index(formula, 1)

    data = Map.put(data, :formula, first_argument)
    current_vertice = Main.run(data)
    if current_vertice do
      data = Map.put(data, :formula, second_argument)
      data = Map.put(data, :current_vertice, current_vertice)
      Main.run(data)
    else
      false
    end
  end

  def execute_or(data) do
    formula = data[:formula]
    first_argument = FormulaHelper.get_argument_by_index(formula, 0)
    second_argument = FormulaHelper.get_argument_by_index(formula, 1)

    data_01 = Map.put(data, :formula, first_argument)
    data_02 = Map.put(data, :formula, second_argument)

    Main.run(data_01) || Main.run(data_02)
  end
end
