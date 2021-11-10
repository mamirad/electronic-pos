require 'test_helper'

class ItemsReturnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_return = items_returns(:one)
  end

  test "should get index" do
    get items_returns_url
    assert_response :success
  end

  test "should get new" do
    get new_items_return_url
    assert_response :success
  end

  test "should create items_return" do
    assert_difference('ItemsReturn.count') do
      post items_returns_url, params: { items_return: { item_id: @items_return.item_id, quantity: @items_return.quantity, return_at: @items_return.return_at } }
    end

    assert_redirected_to items_return_url(ItemsReturn.last)
  end

  test "should show items_return" do
    get items_return_url(@items_return)
    assert_response :success
  end

  test "should get edit" do
    get edit_items_return_url(@items_return)
    assert_response :success
  end

  test "should update items_return" do
    patch items_return_url(@items_return), params: { items_return: { item_id: @items_return.item_id, quantity: @items_return.quantity, return_at: @items_return.return_at } }
    assert_redirected_to items_return_url(@items_return)
  end

  test "should destroy items_return" do
    assert_difference('ItemsReturn.count', -1) do
      delete items_return_url(@items_return)
    end

    assert_redirected_to items_returns_url
  end
end
