require "application_system_test_case"

class ItemsReturnsTest < ApplicationSystemTestCase
  setup do
    @items_return = items_returns(:one)
  end

  test "visiting the index" do
    visit items_returns_url
    assert_selector "h1", text: "Items Returns"
  end

  test "creating a Items return" do
    visit items_returns_url
    click_on "New Items Return"

    fill_in "Item", with: @items_return.item_id
    fill_in "Quantity", with: @items_return.quantity
    fill_in "Return at", with: @items_return.return_at
    click_on "Create Items return"

    assert_text "Items return was successfully created"
    click_on "Back"
  end

  test "updating a Items return" do
    visit items_returns_url
    click_on "Edit", match: :first

    fill_in "Item", with: @items_return.item_id
    fill_in "Quantity", with: @items_return.quantity
    fill_in "Return at", with: @items_return.return_at
    click_on "Update Items return"

    assert_text "Items return was successfully updated"
    click_on "Back"
  end

  test "destroying a Items return" do
    visit items_returns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Items return was successfully destroyed"
  end
end
