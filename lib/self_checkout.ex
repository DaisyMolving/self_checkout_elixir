defmodule SelfCheckout do

  def calculate_total_cost_for_items(num_of_items) do
    calc_total(num_of_items, 0)
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

  def display_all_costs(cost) do
    display_subtotal(cost)
    display_tax_and_total(cost)
  end

  def display_subtotal(cost) do
    IO.puts "The subtotal is £#{cost}"
  end

  def display_tax_and_total(cost) do
    IO.puts "The tax is £#{calc_tax(cost)}"
    IO.puts "The total cost is £#{calc_total(cost)}"
  end

  defp calc_tax(cost) do
    tax = cost * 0.055
  end

  defp calc_total(cost) do
    total = cost * 1.055
  end

  defp calc_total(0, total_amount), do: display_all_costs(total_amount)
  defp calc_total(num_of_items, total_amount) do
    amount = convert_to_num(request_item_price) * convert_to_num(request_item_quantity)
    calc_total(num_of_items - 1, total_amount + amount)
  end

  defp extract_number({num, _rem}), do: num
  defp extract_number(:error), do: :invalid
end
