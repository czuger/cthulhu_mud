module GameBoardSetting::TurnManagement

  include GameBoardSetting::CluesGeneration

  def start_game
    unless started
      generate_clues
      generate_portal
      update_attribute( :started, true )
    end
  end

  def next_turn
    decrease_destiny
    mythos_phase
    shift_presage
    update_attribute( :turns, turns+1 )
    check_game_end
  end

  private

  def check_game_end
    if destiny <= 0
      update_attributes( game_board_open: false, end_result: :azatoth_win )
    end
    if turns >= GameBoard::MAX_TURNS
      update_attributes( game_board_open: false, end_result: :investigators_wins )
    end
  end

  def mythos_phase
    if rand( 1 .. 2 ) == 1
      generate_clues
    else
      generate_portal
    end
  end

  def generate_portal
    portals_count = ( investigators.count.to_f / 2.0 ).ceil
    1.upto( portals_count ).each do
      places_without_portals_ids = Place.leaves.pluck( :id ) - places_with_portal_ids
      Portal.create( game_board_id: id, place_id: places_without_portals_ids.sample, presage: GameBoard::PRESAGES.sample )
    end
  end

  def decrease_destiny
    destiny_decreasement = 0
    portals.each do |portal|
      destiny_decreasement += 1 if portal.presage == current_presage
    end
    update_attribute( :destiny, destiny - destiny_decreasement ) if destiny_decreasement > 0
    game_board_logs.create(
      presage: current_presage, portal_count: destiny_decreasement, final_destiny: destiny
    )
  end

  def shift_presage
    update_attribute( :current_presage, next_presage )
    current_presage_index = GameBoard::PRESAGES.index( current_presage.to_sym )
    current_presage_index += 1
    current_presage_index = 0 if current_presage_index > GameBoard::PRESAGES.count - 1
    update_attribute( :next_presage, GameBoard::PRESAGES[ current_presage_index ] )
  end

end