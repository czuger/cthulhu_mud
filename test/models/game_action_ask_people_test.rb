require 'test_helper'

class GameActionAskPeopleTest < ActiveSupport::TestCase

  def setup
    @gb = create( :game_board )
    @arkham = Place.find_by_code( 'arkham' )
    @kingsport = Place.find_by_code( 'kingsport' )
    investigator = create( :george_bigot, game_board: @gb )
    # Need to reload the investigator that way otherwise, GameAction dont get the proper descendent
    @investigator = Investigator.find( investigator.id )
    @action = @investigator.game_action
    @clue_in_arkham = create( :clue, game_board: @gb, place: @arkham )
    @clue_in_kingsport = create( :clue, game_board: @gb, place: @kingsport )
  end

  test 'ask_people - no successes' do
    Clue.stubs(:find_by_game_board_id_and_place_id).returns( @clue_in_arkham )
    @investigator.expects(:make_test).returns( 0 )
    @action.check_action
    Clue.unstub(:find_by_game_board_id_and_place_id)
    assert_equal :bad_asking, @action.action_result
  end

  test 'ask_people - one success - no clue' do
    @clue_in_arkham.destroy
    @clue_in_kingsport.destroy
    @investigator.expects(:make_test).returns( 1 )
    @action.check_action
    assert_equal :i_dont_know, @action.action_result
  end

  test 'ask_people - one success - one clue local' do
    @clue_in_kingsport.destroy
    @investigator.expects(:make_test).returns( 1 )
    @action.check_action
    assert_equal :it_is_here, @action.action_result
  end

  test 'ask_people - one success - one clue neighbours' do
    @clue_in_arkham.destroy
    @investigator.expects(:make_test).returns( 1 )
    @action.check_action
    assert_equal :clue_position, @action.action_result
  end

  test 'ask_people - two success - one clues local and neighbour (two clues)' do
    @investigator.expects(:make_test).returns( 2 )
    @action.check_action
    assert_equal :finds_multiples_clues, @action.action_result
  end

  test 'ask_people - three success - one clues local and neighbour (two clues)' do
    @investigator.expects(:make_test).returns( 3 )
    @action.check_action
    assert_equal :finds_multiples_clues, @action.action_result
  end
end
