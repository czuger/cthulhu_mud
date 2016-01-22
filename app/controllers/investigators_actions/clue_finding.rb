module InvestigatorsActions::ClueFinding

  # TODO : transformer ces deux actions en game_action, ajouter un timer et garder dans la table action le resultat de l'action (peut être un champs serialisable)

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

  def ask_people
    @investigator.game_action.ask_people
    redirect_to game_board_investigators_url( @current_game_board )
  end

end