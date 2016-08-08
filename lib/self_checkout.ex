defmodule SelfCheckout do

  def request_item_price do
    IO.gets("Enter the price of item: ")
  end

  def request_item_quantity do
    IO.gets("Enter the quantity of item: ")
  end

  def convert_to_num(string) do
    Integer.parse(string) |> extract_number
  end

  defp extract_number({num, _rem}), do: num
  defp extract_number(:error), do: :invalid
end
