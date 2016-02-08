require 'test_helper'

class GameActionInvestigateTest < ActiveSupport::TestCase

  def setup
    @gb = create( :game_board )
    @arkham = Place.find_by_code( 'arkham' )
    investigator = create( :benot_lerouge, game_board: @gb )
    @investigator = Investigator.find( investigator.id )
    @action = @investigator.game_action
  end

  test 'investigate - find_clue' do
    @action.print_action_data
    @action.check_action
    create( :clue, game_board: @gb, place: @arkham )
    @investigator.expects(:make_test).returns( 1 )
    @action.check_action
    assert_equal :find_clue, @action.action_result
  end

  test 'investigate - no_clue_there' do
    @action.print_action_data
    @action.check_action
    @investigator.expects(:make_test).returns( 1 )
    @action.check_action
    assert_equal :no_clue_there, @action.action_result
  end

  test 'investigate - blocked_by_monster' do
    @action.print_action_data
    @action.check_action
    create( :monster_on_board, game_board: @gb )
    @investigator.expects(:make_test).returns( 1 )
    @action.check_action
    assert_equal :blocked_by_monster, @action.action_result
  end

  test 'investigate - find_nothing' do
    @action.print_action_data
    @action.check_action
    @investigator.expects(:make_test).returns( 0 )
    @action.check_action
    assert_equal :find_nothing, @action.action_result
  end

end
