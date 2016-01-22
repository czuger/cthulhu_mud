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
    mythos_phase
  end

  private

  def mythos_phase
    if rand( 1 .. 2 ) == 1
      generate_clues
    else
      generate_portal
    end
  end

  def generate_portal
    places_without_portals_ids = Place.all.pluck( :id ) - places_with_portal_ids
    Portal.create( game_board_id: id, place_id: places_without_portals_ids.sample, presage: GameBoard::PRESAGES.sample )
  end

end