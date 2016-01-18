require 'test_helper'

class InvestigatorsControllerTest < ActionController::TestCase
  setup do
    @investigator = investigators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investigator" do
    assert_difference('Investigator.count') do
      post :create, investigator: { location_id: @investigator.location_id, name: @investigator.name }
    end

    assert_redirected_to investigator_path(assigns(:investigator))
  end

  test "should show investigator" do
    get :show, id: @investigator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investigator
    assert_response :success
  end

  test "should update investigator" do
    patch :update, id: @investigator, investigator: { location_id: @investigator.location_id, name: @investigator.name }
    assert_redirected_to investigator_path(assigns(:investigator))
  end

  test "should destroy investigator" do
    assert_difference('Investigator.count', -1) do
      delete :destroy, id: @investigator
    end

    assert_redirected_to investigators_path
  end
end
