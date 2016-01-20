module InvestigatorsActions::Movement

  def move
    set_investigator
    @travels = Travel.where( place_from_id: @investigator.location_id )
  end

  def move_start
    set_investigator
    travel = Travel.find( params[ :travel_destination ] )
    @investigator.update_attributes(
      location_id: nil, travel_id: travel.id, travel_start_time: Time.now
    )
    redirect_to game_board_investigators_url( @current_game_board )
  end

end