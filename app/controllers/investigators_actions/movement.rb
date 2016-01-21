module InvestigatorsActions::Movement

  def movement_selection
    set_investigator
    @travels = @investigator.game_action.movement_possibilities
  end

  def move_start
    set_investigator
    travel = Travel.find( params[ :travel_destination ] )
    @investigator.game_action.move_to( travel )
    redirect_to game_board_investigators_url( @current_game_board )
  end

end