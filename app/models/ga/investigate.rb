class Ga::Investigate < Ga::AskPeople

  def set_action_result
    clue = Clue.find_by_game_board_id_and_place_id( investigator.game_board_id, location_id )
    investigation_successful = investigator.make_test( :observation ) > 0
    @action_result = :find_nothing

    unless check_for_monster
      if investigation_successful
        if clue
          # On a successful observation test, the investigator get the indice
          ActiveRecord::Base.transaction do

            # Mark the clue as found in the news
            in_the_news= InTheNewsPlace.find_by_game_board_id_and_place_id( clue.game_board_id, clue.place_id )
            raise "#{self.class}##{__method__} : Unable to find News for clue #{clue.inspect}" unless in_the_news
            in_the_news.update_attribute( :discovered_clue, true )

            # Then remove the clue
            clue.destroy

            # Add the clue to investigator pool
            investigator.update_attribute( :clues, investigator[ :clues ] + 1 )
          end
          @action_result = :find_clue
        else
          @action_result = :no_clue_there
        end
      end
    else
      @action_result = :blocked_by_monster
    end
  end

  def get_action_name
    :investigation
  end

end