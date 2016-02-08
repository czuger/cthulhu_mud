require 'test_helper'

class GameActionTest < ActiveSupport::TestCase

  def setup
    @gb = create( :game_board )
  end

  test 'combat_monster : hard_fight' do
    create( 'teddy_smith', game_board: @gb )
    investigator = Investigator.find_by_name( 'Teddy Smith' )
    action = investigator.game_action
    monster_on_board = create( :monster_on_board, game_board: @gb, hit_points: 10 )
    investigator.update_attribute( :stamina, 2 )
    monster_on_board.monster.update_attribute( :damages, 1 )
    investigator.stubs(:make_test).returns( 0 )
    action.check_action
    assert_equal :a_hard_fight_but_nobody_win, action.action_result
  end

  test 'combat_monster : investigator_die' do
    create( 'teddy_smith', game_board: @gb )
    investigator = Investigator.find_by_name( 'Teddy Smith' )
    action = investigator.game_action
    monster_on_board = create( :monster_on_board, game_board: @gb, hit_points: 10 )
    investigator.update_attribute( :stamina, 1 )
    monster_on_board.monster.update_attribute( :damages, 1 )
    investigator.stubs(:make_test).returns( 0 )
    action.check_action
    assert_equal :investigator_die, action.action_result
  end

  test 'combat_monster : investigator goes mad' do
    create( 'teddy_smith', game_board: @gb )
    investigator = Investigator.find_by_name( 'Teddy Smith' )
    action = investigator.game_action
    create( :monster_on_board, game_board: @gb )
    investigator.expects(:make_test).returns( 0 )
    investigator.update_attribute( :sanity, 1 )
    action.check_action
    assert_equal :investigator_goes_mad, action.action_result
  end

  test 'combat_monster : monster weak' do
    create( 'teddy_smith', game_board: @gb )
    investigator = Investigator.find_by_name( 'Teddy Smith' )
    action = investigator.game_action
    create( :monster_on_board, game_board: @gb )
    investigator.stubs(:make_test).returns( 10 )
    action.check_action
    assert_equal :monster_die, action.action_result
  end

  test 'combat_monster : no monster' do
    create( 'teddy_smith', game_board: @gb )
    investigator = Investigator.find_by_name( 'Teddy Smith' )
    action = investigator.game_action
    action.print_action_data
    action.check_action
    assert_equal :no_monster_on_board, action.action_result
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

end
