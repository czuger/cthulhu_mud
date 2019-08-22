require 'test_helper'

class GameBoardLogsControllerTest < ActionController::TestCase
  test "should get show" do
    game_board = create( :game_board )
    get :show, params: { game_board_id: game_board }
    assert_response :success
  end
end
