class Ga::AskPeople < GameAction

  ACTION_DURATION = 5

  def print_action_data
    action_eta_int = action_eta
    {
      location_to_print: location.name_with_ancestors,
      eta_int: action_eta_int, eta_str: Time.at( action_eta_int ).utc.strftime( '%T' ),
      action: ACTION
    }
  end

  def check_action
    if action_eta <= 0
      ActiveRecord::Base.transaction do
        set_action_result
        store_result
        wait
      end
    end
  end

  # Caution : CONSTANT won't work there. Not overloaded by heritage.
  def get_action_name
    :ask_people
  end

  private

  def set_action_result
    asking_successful = investigator.make_test( :influence ) > 0

    if asking_successful
      clue = Clue.find_by_game_board_id_and_place_id( investigator.game_board_id, location_id )
      if clue
        @action_result = :it_is_here
      else
        location.neighbours.each do |neighbour|
          clue = Clue.find_by_game_board_id_and_place_id( investigator.game_board_id, neighbour.id )
          if clue
            @action_result = :clue_position
            @result_location_id = neighbour.id
            return
          end
        end
        @action_result = :i_dont_know
      end
    else
      @action_result = :bad_asking
    end
  end

  def store_result
    GameActionLog.create!( investigator_id: investigator.id,
                           action_type: get_action_name, action_location_id: location_id,
                           result_code: @action_result, result_location_id: @result_location_id
    )
  end

  def wait
    ActiveRecord::Base.transaction do
      new_action = Ga::Waiting.create( location_id: location_id, travel_id: nil, start_time: Time.now )
      investigator.update_attribute( :game_action_id, new_action.id )
      self.destroy
    end
  end

  def action_eta
    action_elapsed_time = Time.now - start_time
    duration = ACTION_DURATION
    duration - action_elapsed_time
  end

  def action_result( action, location: nil )
    I18n.t( "actions_results.#{action}", location: location )
  end

end

