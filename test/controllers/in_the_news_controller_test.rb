require 'test_helper'

class InTheNewsControllerTest < ActionController::TestCase
  test "should get show" do
    @game_board = create( :game_board )
    get :show, game_board_id: @game_board.id
    assert_response :success
  end

end
