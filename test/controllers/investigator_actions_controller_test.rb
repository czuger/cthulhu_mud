require 'test_helper'

class InvestigatorActionsControllerTest < ActionController::TestCase
  test "should get show" do
    @game_board = create( :game_board )
    @investigator = @game_board.investigators.first
    get :show, game_board_id: @game_board, investigator_id: @investigator
    assert_response :success
  end

end
