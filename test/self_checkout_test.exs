defmodule SelfCheckoutTest do
  import ExUnit.CaptureIO
  use ExUnit.Case

  test "displays message to ask for price of item" do
    result = capture_io(fn ->
      SelfCheckout.request_item_price
    end)
    assert result == "Enter the price of item"
  end

  test "retrieves user input for the price of an item" do
    result = capture_io([input: "1", capture_prompt: false], fn ->
      value = SelfCheckout.request_item_price
      IO.write(value)
    end)
    assert result == "1"
  end
end
