require 'test_helper'

class GameActionTest < ActiveSupport::TestCase

  test 'waiting' do
    gb = create( :game_board )
    investigator = gb.investigators.first
    travel = Travel.first
    waiting = investigator.game_action
    waiting.print_action_data
    waiting.move_to( travel )
  end

  test 'movement' do
    gb = create( :game_board )
    investigator = Investigator.find_by_name( 'Allyson Masley' )
    action = investigator.game_action
    action.print_action_data
    action.check_action
    action.wait
  end

end
