class Ga::AskPeople < Ga::BaseAction

  private

  def set_action_result
    nb_successes = investigator.make_test( :influence )

    if nb_successes == 0
      @action_result = :bad_asking
    elsif nb_successes == 1
      clues = get_local_and_nearby_clues
      if clues.empty?
        @action_result = :i_dont_know
      else
        if clues.first.place_id == location_id
          @action_result = :it_is_here
        else
          @action_result = :clue_position
          @result_location_id = clues.first.place_id
        end
      end
    else
      clues = get_local_and_nearby_clues
      1.upto( nb_successes ).each do
        clue = clues.shift
        get_clue( clue ) if clue
      end
      @action_result = :finds_multiples_clues
      @result_location_id = location_id
    end
  end

  def get_local_and_nearby_clues
    clues = []
    clues << Clue.find_by_game_board_id_and_place_id( investigator.game_board_id, location_id )

    location.neighbours.each do |neighbour|
      clues << Clue.find_by_game_board_id_and_place_id( investigator.game_board_id, neighbour.id )
    end

    clues.compact.reject{ |e| e == false }
  end

end

