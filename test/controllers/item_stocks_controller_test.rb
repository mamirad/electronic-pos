require 'test_helper'

class ItemStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_stock = item_stocks(:one)
  end

  test "should get index" do
    get item_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_item_stock_url
    assert_response :success
  end

  test "should create item_stock" do
    assert_difference('ItemStock.count') do
      post item_stocks_url, params: { item_stock: { item_id: @item_stock.item_id, quantity: @item_stock.quantity, remarks: @item_stock.remarks } }
    end

    assert_redirected_to item_stock_url(ItemStock.last)
  end

  test "should show item_stock" do
    get item_stock_url(@item_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_stock_url(@item_stock)
    assert_response :success
  end

  test "should update item_stock" do
    patch item_stock_url(@item_stock), params: { item_stock: { item_id: @item_stock.item_id, quantity: @item_stock.quantity, remarks: @item_stock.remarks } }
    assert_redirected_to item_stock_url(@item_stock)
  end

  test "should destroy item_stock" do
    assert_difference('ItemStock.count', -1) do
      delete item_stock_url(@item_stock)
    end

    assert_redirected_to item_stocks_url
  end
end
