class Ga::BaseAction < GameAction

  ACTION_DURATION = 5

  def print_action_data
    action_eta_int = action_eta
    {
      location_to_print: location.full_localisation_name,
      eta_int: action_eta_int, eta_str: Time.at( action_eta_int ).utc.strftime( '%T' ),
      action: get_action_name
    }
  end

  def check_action
    if action_eta <= 0
      ActiveRecord::Base.transaction do
        set_action_result
        store_result
        terminate_action
        wait
      end
    end
  end

  # Caution : CONSTANT won't work there. Not overloaded by heritage.
  def get_action_name
    :ask_people
  end

  private

  def store_result
    GameActionLog.create!( investigator_id: investigator.id,
                           action_type: get_action_name, action_location_id: location_id,
                           result_code: @action_result, result_location_id: @result_location_id
    )
  end

  def wait
    ActiveRecord::Base.transaction do
      final_location_id = location_id
      if investigator.dead
        final_location_id = Place.find_by_code( 'hopital_sainte_marie' ).id
      end
      if investigator.mad
        final_location_id = Place.find_by_code( 'asylum' ).id
      end
      new_action = Ga::Waiting.create( location_id: final_location_id, travel_id: nil, start_time: Time.now )
      investigator.update_attribute( :game_action_id, new_action.id )
      self.destroy
    end
  end

  def action_eta
    action_elapsed_time = Time.now - start_time
    duration = ACTION_DURATION
    duration - action_elapsed_time
  end

  def get_clue( clue )

    ActiveRecord::Base.transaction do

      # Mark the clue as found in the news
      in_the_news= InTheNewsPlace.find_by_game_board_id_and_place_id( clue.game_board_id, clue.place_id )

      if in_the_news
        in_the_news.update_attribute( :discovered_clue, true )
      end

      # Then remove the clue
      clue.destroy

      # Add the clue to investigator pool
      investigator.update_attribute( :clues, investigator[ :clues ] + 1 )
    end

  end

end

