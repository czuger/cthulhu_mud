require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = create( :arkham )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post :create, place: { default_translation: @place.default_translation, parent_id: [], gender: :p }
    end

    assert_redirected_to places_path
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    patch :update, id: @place, place: { code: @place.code, default_translation: @place.default_translation, parent_id: [] }
    assert_redirected_to places_path
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end
end
