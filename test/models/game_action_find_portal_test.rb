require 'test_helper'

class GameActionFindPortalTest < ActiveSupport::TestCase

  def setup
    @gb = create( :game_board )
    @arkham = Place.find_by_code( 'arkham' )
    investigator = create( :david_underhill, game_board: @gb )
    # Need to reload the investigator that way otherwise, GameAction dont get the proper descendent
    @investigator = Investigator.find( investigator.id )
    @action = @investigator.game_action
  end

  test 'close_portal - enough clues' do
    create( :portal, game_board: @gb, place: @arkham )
    @action.check_action
    assert_equal :portal_discovered, @action.action_result
  end

  test 'close_portal - enough clues - no portal' do
    @action.check_action
    assert_equal :no_portals, @action.action_result
  end

  test 'close_portal - not_enough_clues' do
    @investigator.update_attribute( :clues, 0 )
    @action.check_action
    assert_equal :not_enough_clues, @action.action_result
  end

end
