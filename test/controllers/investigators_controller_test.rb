require 'test_helper'
require 'pp'

class InvestigatorsControllerTest < ActionController::TestCase
  setup do
    @game_board = create( :game_board )
    @investigator = @game_board.investigators.first
    @travel = create( :arkham_to_kingsport )
  end

  test "should get index" do
    get :index, game_board_id: @game_board
    assert_response :success
    assert_not_nil assigns(:investigators)
  end

  test "should get new" do
    get :new, game_board_id: @game_board
    assert_response :success
  end

  test "should create investigator" do
    assert_difference('Investigator.count') do
      post :create, game_board_id: @game_board, investigator: {
        name: @investigator.name, profession_id: @investigator.profession_id, gender: :m }
    end

    assert_redirected_to game_board_investigators_path( assigns( :current_game_board ) )
  end

  test "should show investigator" do
    get :show, game_board_id: @game_board, id: @investigator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investigator, game_board_id: @game_board
    assert_response :success
  end

  test "should update investigator" do
    patch :update, game_board_id: @game_board, id: @investigator, investigator: {
      name: @investigator.name }
    assert_redirected_to [ assigns( :current_game_board ), assigns( :investigator ) ]
  end

  test "should destroy investigator" do
    assert_difference('Investigator.count', -1) do
      delete :destroy, game_board_id: @game_board, id: @investigator
    end

    assert_redirected_to game_board_investigators_path( assigns( :current_game_board ) )
  end

  test "should get new name" do
    get :new_name, gender: :m
    assert_response :success
  end

  test "should show moves" do
    get :movement_selection, game_board_id: @game_board, investigator_id: @investigator
    assert_response :success
  end

  test "should move somewhere" do
    get :move_start, game_board_id: @game_board, investigator_id: @investigator, travel_destination: @travel
    assert_redirected_to game_board_investigators_url( assigns( :current_game_board ) )
  end

  test "should read the news" do
    get :read_the_news, game_board_id: @game_board, investigator_id: @investigator
    assert_response :success
  end

  test "should investigate a place" do
    get :investigate_a_place, game_board_id: @game_board, investigator_id: @investigator
    assert_response :success
  end


end
