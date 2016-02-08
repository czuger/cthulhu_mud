require 'test_helper'

class GameActionClosePortalTest < ActiveSupport::TestCase

  def setup
    @gb = create( :game_board )
    @arkham = Place.find_by_code( 'arkham' )
    investigator = create( :winston_minsterhill, game_board: @gb )
    # Need to reload the investigator that way otherwise, GameAction dont get the proper descendent
    @investigator = Investigator.find( investigator.id )
    @action = @investigator.game_action
  end

  test 'close_portal - success' do
    create( :portal, game_board: @gb, place: @arkham )
    @action.check_action
    assert_equal :portal_closed, @action.action_result
  end

  test 'close_portal - no_portal' do
    @action.check_action
    assert_equal :no_portal, @action.action_result
  end

  test 'close_portal - not_enough_clues' do
    create( :portal, game_board: @gb, place: @arkham )
    @investigator.update_attribute( :clues, 0 )
    @action.check_action
    assert_equal :not_enough_clues, @action.action_result
  end

  test 'close_portal - blocked_by_monster' do
    create( :portal, game_board: @gb, place: @arkham )
    create( :monster_on_board, game_board: @gb )
    @action.check_action
    assert_equal :blocked_by_monster, @action.action_result
  end

end
