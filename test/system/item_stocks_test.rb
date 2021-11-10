require "application_system_test_case"

class ItemStocksTest < ApplicationSystemTestCase
  setup do
    @item_stock = item_stocks(:one)
  end

  test "visiting the index" do
    visit item_stocks_url
    assert_selector "h1", text: "Item Stocks"
  end

  test "creating a Item stock" do
    visit item_stocks_url
    click_on "New Item Stock"

    fill_in "Item", with: @item_stock.item_id
    fill_in "Quantity", with: @item_stock.quantity
    fill_in "Remarks", with: @item_stock.remarks
    click_on "Create Item stock"

    assert_text "Item stock was successfully created"
    click_on "Back"
  end

  test "updating a Item stock" do
    visit item_stocks_url
    click_on "Edit", match: :first

    fill_in "Item", with: @item_stock.item_id
    fill_in "Quantity", with: @item_stock.quantity
    fill_in "Remarks", with: @item_stock.remarks
    click_on "Update Item stock"

    assert_text "Item stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Item stock" do
    visit item_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item stock was successfully destroyed"
  end
end
