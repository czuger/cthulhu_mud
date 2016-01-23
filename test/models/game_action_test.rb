require 'test_helper'

class GameActionTest < ActiveSupport::TestCase

  def setup
    @gb = create( :game_board )

  end
  test 'waiting' do
    investigator = @gb.investigators.first
    travel = Travel.first
    waiting = investigator.game_action
    waiting.print_action_data
    waiting.move_to( travel )
  end

  test 'movement' do
    investigator = Investigator.find_by_name( 'Allyson Masley' )
    action = investigator.game_action
    action.print_action_data
    action.check_action
    action.wait
  end

  test 'investigate' do
    create( :benot_lerouge, game_board: @gb )
    investigator = Investigator.find_by_name( 'Benot Lerouge' )
    action = investigator.game_action
    action.print_action_data
    action.check_action
    Clue.stubs(:find_by_game_board_id_and_place_id).returns( create( :clue, game_board: @gb ) )
    Investigator.expects(:make_test).returns( true )
    action.check_action
    Clue.unstub(:find_by_game_board_id_and_place_id)
  end

  test 'ask_people' do
    investigator = Investigator.find_by_name( 'George Bigot' )
    action = investigator.game_action
    action.print_action_data
    action.check_action
    Clue.stubs(:find_by_game_board_id_and_place_id).returns(true)
    action.check_action
    Clue.unstub(:find_by_game_board_id_and_place_id)
  end

  test 'ask_people_deep_in_method' do
    arkham = Place.find_by_name( 'Arkham' )
    investigator = Investigator.find_by_name( 'George Bigot' )
    action = investigator.game_action
    Clue.stubs(:find_by_game_board_id_and_place_id).returns(false)
    Place.expects(:neighbours).returns( [ arkham ] )
    Investigator.expects(:make_test).returns(true)
    action.check_action
    Clue.unstub(:find_by_game_board_id_and_place_id)
    Place.unstub(:neighbours)
  end

end
