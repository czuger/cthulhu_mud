module InvestigatorsActions::ClueFinding

  def setup_in_the_news_places
    @in_the_news_places = @current_game_board.in_the_news_places.sort_by{ |e| [ e.place.parent_id, e.id ] }
    @other_destinations_targeted_by_investigator = @current_game_board.investigators.where.not( destination_id: nil ).pluck( :destination_id )
  end

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

  def combat_monster
    run_action( __method__ )
  end

  private

  def run_action( method )
    @investigator.game_action.send( method )
    redirect_to game_board_investigators_url( @current_game_board )
  end

end