defmodule SelfCheckout do

  def calculate_total_cost_for_items(number_of_items) do
    calc_total(number_of_items, 0)
  end

  def request_item_price do
    IO.gets("Enter the price of item: ")
  end

  def request_item_quantity do
    IO.gets("Enter the quantity of item: ")
  end

  def convert_to_num(string) do
    Integer.parse(string) |> extract_number
  end

  def display_total_cost(cost) do
    IO.write "The total cost is £#{cost}"
  end

  defp calc_total(0, total_amount), do: display_total_cost(total_amount)
  defp calc_total(num_of_items, total_amount) do
    amount  = convert_to_num(request_item_price) * convert_to_num(request_item_quantity)
    calc_total(num_of_items - 1, total_amount + amount)
  end

  defp extract_number({num, _rem}), do: num
  defp extract_number(:error), do: :invalid
end
