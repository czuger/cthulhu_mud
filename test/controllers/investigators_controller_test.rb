require 'test_helper'
require 'pp'

class InvestigatorsControllerTest < ActionController::TestCase
  setup do
    @game_board = create( :game_board )
    @investigator = @game_board.investigators.first
    @travel = Travel.first
  end

  test 'follow path' do
    @game_board = create( :game_board )
    @investigator = create( :graham_bell, game_board: @game_board )
    # pp Place.all.to_a
    get :follow_path, game_board_id: @game_board, investigator_id: @investigator
    assert_redirected_to game_board_investigators_path( assigns( :current_game_board ) )
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

  test "should investigate a place" do
    get :investigate, game_board_id: @game_board, investigator_id: @investigator
    assert_redirected_to game_board_investigators_url( assigns( :current_game_board ) )
  end

  test "should ask people" do
    get :ask_people, game_board_id: @game_board, investigator_id: @investigator
    assert_redirected_to game_board_investigators_url( assigns( :current_game_board ) )
  end

  test "should find portal" do
    get :find_portal, game_board_id: @game_board, investigator_id: @investigator
    assert_redirected_to game_board_investigators_url( assigns( :current_game_board ) )
  end

  test "should close a portal" do
    get :close_portal, game_board_id: @game_board, investigator_id: @investigator
    assert_redirected_to game_board_investigators_url( assigns( :current_game_board ) )
  end

  test "should combat a monster" do
    get :combat_monster, game_board_id: @game_board, investigator_id: @investigator
    assert_redirected_to game_board_investigators_url( assigns( :current_game_board ) )
  end

end
