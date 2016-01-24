module InvestigatorsActions::ClueFinding

  # TODO : transformer ces deux actions en game_action, ajouter un timer et garder dans la table action le resultat de l'action (peut être un champs serialisable)

  def investigate
    run_action( __method__ )
  end

  def ask_people
    run_action( __method__ )
  end

  def find_portal
    run_action( __method__ )
  end

  def close_portal
    run_action( __method__ )
  end

  private

  def run_action( method )
    @investigator.game_action.send( method )
    redirect_to game_board_investigators_url( @current_game_board )
  end

end