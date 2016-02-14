require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = create( :item )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { code: @item.code, combat: @item.combat, cost: @item.cost, default_translation: '45 Automatique', influence: @item.influence, observation: @item.observation, will: @item.will }
    end

    last_created_item = Item.last

    assert_equal 'i45_automatique', last_created_item.code

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { code: @item.code, combat: @item.combat, cost: @item.cost, default_translation: @item.default_translation, influence: @item.influence, observation: @item.observation, will: @item.will }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
