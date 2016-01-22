module InvestigatorsActions::ClueFinding

  # TODO : transformer ces deux actions en game_action, ajouter un timer et garder dans la table action le resultat de l'action (peut être un champs serialisable)
  def ask_people
    asking_successful = @investigator.make_test( :influence ) > 0

    if asking_successful
      clue = Clue.find_by_game_board_id_and_place_id( @current_game_board, @investigator.location )
      if clue
        action_result( :it_is_here )
      else
        @investigator.game_action.location.neighbours.each do |neighbour|
          clue = Clue.find_by_game_board_id_and_place_id( @current_game_board, neighbour )
          if clue
            return action_result( :clue_position, location: neighbour.name_with_ancestors )
          end
          action_result( :i_dont_know )
        end
      end
    else
      action_result( :bad_asking )
    end

  end

  def investigate_a_place
    clue = Clue.find_by_game_board_id_and_place_id( @current_game_board, @investigator.location )
    investigation_successful = @investigator.make_test( :observation ) > 0
    @result = 'You find nothing. Maybe you can search better.'

    if investigation_successful
      if clue
        # On a successful observation test, the investigator get the indice
        ActiveRecord::Base.transaction do
          #  First we remove this clue
          clue.destroy
          @investigator.update_attribute( :clues, @investigator[ :clues ] + 1 )
        end
        @result = 'You find a clue !!'
      else
        @result = 'You searched everywhere and you are sure that there is nothing.'
      end
    end
  end

  private

  def action_result( action, location: nil )
    @result = I18n.t( "actions_results.#{action}", location: location )
  end

end