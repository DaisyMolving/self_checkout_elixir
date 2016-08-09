defmodule SelfCheckoutTest do
  import ExUnit.CaptureIO
  use ExUnit.Case

  test "displays message to ask for price of item" do
    func = &SelfCheckout.request_item_price/0
    result = capture_output(func)
  assert result == "Enter the price of item: "
  end

  test "retrieves user input for the price of an item" do
    input = "1"
    func = &SelfCheckout.request_item_price/0
    result = capture_user_input(input, func)
    assert result == "1"
  end

  test "displays message to ask for quantity of item" do
    func = &SelfCheckout.request_item_quantity/0
    result = capture_output(func)
    assert result == "Enter the quantity of item: "
  end

  test "retrieves user input for the quantity of an item" do
    input = "2"
    func = &SelfCheckout.request_item_quantity/0
    result = capture_user_input(input, func)
    assert result == "2"
  end

  test "converts a string to a numeric value" do
    assert SelfCheckout.convert_to_num("1") == 1
    assert SelfCheckout.convert_to_num("5") == 5
  end

  test "validates user input when converting to a number" do
    assert SelfCheckout.convert_to_num("blah") == :invalid
  end

  test "displays the total cost of the times" do
    result = capture_io(fn ->
      SelfCheckout.display_total_cost(50)
    end)
    assert result == "The total cost is £50"
  end

  test "sums up all the items from the user" do
    result = capture_io([input: "25\n2\n10\n1", capture_prompt: false], fn ->
      SelfCheckout.calculate_total_cost_for_items(2)
    end)

    assert result == "The total cost is £60"
  end

  defp capture_user_input(input, func) do
    capture_io([input: input, capture_prompt: false], fn ->
      value = func.()
      IO.write(value)
    end)
  end

  defp capture_output(func) do
    capture_io(fn ->
      func.()
    end)
  end
end
