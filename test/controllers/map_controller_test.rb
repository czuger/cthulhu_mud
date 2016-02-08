require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  test "should get show" do
    create( :game_board )
    get :show
    assert_response :success
  end

end
