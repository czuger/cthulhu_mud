module GameBoardSetting::TurnManagement

  include GameBoardSetting::CluesGeneration

  def start_game
    unless started
      ActiveRecord::Base.transaction do
        generate_clues
        generate_portal
        update_attribute( :started, true )
      end
    end
  end

  def next_turn
    ActiveRecord::Base.transaction do
      decrease_destiny
      mythos_phase
      shift_presage
      update_attribute( :turns, turns+1 )
      check_game_end
      give_investigators_actions_points
    end
  end

  private

  def give_investigators_actions_points
    investigators.each do |investigator|
      investigator.update_attribute( :actions_count, GameBoard::INVESTIGATORS_ACTIONS_POINTS )
    end
  end

  def check_game_end
    if destiny <= 0
      update_attributes( game_board_open: false, end_result: :azatoth_win )
    end
    if turns >= GameBoard::MAX_TURNS
      update_attributes( game_board_open: false, end_result: :investigators_wins )
    end
  end

  def mythos_phase

    # First remove all found indices from the news
    cleanup_places_in_the_news

    # Then generate new indices and portals
    if rand( 1 .. 10 ) >= 5
      generate_clues
    end
    if rand( 1 .. 10 ) >= 8
      generate_portal
    end

  end

  def generate_portal
    portals_count = ( investigators.count.to_f / 2.0 ).ceil
    1.upto( portals_count ).each do
      places_without_portals_ids = Place.leaves.pluck( :id ) - places_with_portal_ids
      portal = Portal.create!( game_board_id: id, place_id: places_without_portals_ids.sample, presage: GameBoard::PRESAGES.sample )
      generate_monster( portal, 1 )
    end
  end

  def generate_monster( portal, monster_count )
    monsters_hash = {}
    monster_hash_inc = 1
    place = portal.place
    place.monsters.each do |monster|
      1.upto( monster.apparition_weight ).each do
        monsters_hash[ monster_hash_inc ] = monster
        monster_hash_inc += 1
      end
    end
    1.upto( monster_count ).each do
      monster_rand = rand( 1 .. monster_hash_inc - 1 )
      monster = monsters_hash[ monster_rand ]
      MonsterOnBoard.create!( game_board_id: id, monster_id: monster.id, place_id: place.id, hit_points: monster.hit_points )
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