class GameAction < ActiveRecord::Base

  attr_reader :action_result

  has_one :investigator
  belongs_to :location, class_name: 'Place', foreign_key: :location_id
  belongs_to :travel, class_name: 'Travel', foreign_key: :travel_id

  def check_action
    # Default check action is nothing : will be overloaded by some actions.
  end

  private

  def terminate_action
    investigator.update_attribute( :actions_count, investigator.actions_count - 1 )
    game_board = investigator.game_board
    actions_points_count = 0
    game_board.investigators.each do |investigator|
      actions_points_count += investigator.actions_count
    end
    if actions_points_count <= 0
      game_board.next_turn
    end
  end

  def check_for_monster
    game_board_id = investigator.game_board_id
    MonsterOnBoard.find_by_game_board_id_and_place_id( game_board_id, location_id )
  end

end
