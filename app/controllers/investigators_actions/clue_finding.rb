module InvestigatorsActions::ClueFinding

  # TODO : transformer ces deux actions en game_action, ajouter un timer et garder dans la table action le resultat de l'action (peut être un champs serialisable)

  def investigate_a_place
    @investigator.game_action.investigate
    redirect_to game_board_investigators_url( @current_game_board )
  end

  def ask_people
    @investigator.game_action.ask_people
    redirect_to game_board_investigators_url( @current_game_board )
  end

end