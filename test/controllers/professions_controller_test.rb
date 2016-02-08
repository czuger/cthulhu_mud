require 'test_helper'

class ProfessionsControllerTest < ActionController::TestCase
  setup do
    @profession = create( :private )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profession" do
    assert_difference('Profession.count') do
      post :create, profession: { name: @profession.name, start_place_id: @profession.start_place_id, influence: 1, observation: 1, will: 1, combat: 1, stamina: 1, sanity: 1 }
    end

    assert_redirected_to profession_path(assigns(:profession))
  end

  test "should show profession" do
    get :show, id: @profession
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profession
    assert_response :success
  end

  test "should update profession" do
    patch :update, id: @profession, profession: { name: @profession.name, start_place_id: @profession.start_place_id }
    assert_redirected_to profession_path(assigns(:profession))
  end

  test "should destroy profession" do
    assert_difference('Profession.count', -1) do
      delete :destroy, id: @profession
    end

    assert_redirected_to professions_path
  end
end
