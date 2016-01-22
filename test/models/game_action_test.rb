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

  test 'ask_people' do
    gb = create( :game_board )
    investigator = Investigator.find_by_name( 'George Bigot' )
    action = investigator.game_action
    action.print_action_data
    action.check_action
    Clue.stubs(:find_by_game_board_id_and_place_id).returns(true)
    action.check_action
    Clue.unstub(:find_by_game_board_id_and_place_id)
  end

  test 'ask_people_deep_in_method' do
    gb = create( :game_board )
    investigator = Investigator.find_by_name( 'George Bigot' )
    action = investigator.game_action
    Clue.stubs(:find_by_game_board_id_and_place_id).returns(false)
    Place.expects(:neighbours).returns( [ create(:arkham) ] )
    puts Place.all.to_a.inspect
    puts action.location.neighbours.inspect
    Investigator.expects(:make_test).returns(true)
    action.check_action
    Clue.unstub(:find_by_game_board_id_and_place_id)
    Place.unstub(:neighbours)
  end

end
