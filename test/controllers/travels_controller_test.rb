require 'test_helper'

class TravelsControllerTest < ActionController::TestCase
  setup do
    @travel = create( :arkham_to_kingsport )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel" do
    assert_difference('Travel.count') do
      post :create, travel: { cost: @travel.cost, duration: @travel.duration, place_from_id: @travel.place_from_id, place_to_id: @travel.place_to_id }
    end

    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should show travel" do
    get :show, id: @travel
    assert_response :success
  end

  test "should create the wayback" do
    get :wayback, travel_id: @travel
    assert_redirected_to travel_path(assigns(:travel_wayback))
  end

  test "should get edit" do
    get :edit, id: @travel
    assert_response :success
  end

  test "should update travel" do
    patch :update, id: @travel, travel: { cost: @travel.cost, duration: @travel.duration, place_from_id: @travel.place_from_id, place_to_id: @travel.place_to_id }
    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should destroy travel" do
    assert_difference('Travel.count', -1) do
      delete :destroy, id: @travel
    end

    assert_redirected_to travels_path
  end
end
