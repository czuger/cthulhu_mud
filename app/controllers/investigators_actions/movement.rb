module InvestigatorsActions::Movement

  def movement_selection
    set_investigator
    @travels = @investigator.game_action.movement_possibilities
  end

  def move_start
    set_investigator
    travel = Travel.find( params[ :travel_destination ] )
    ActiveRecord::Base.transaction do
      old_action = @investigator.game_action
      new_action = Ga::Movement.create( travel_id: travel.id, start_time: Time.now )
      @investigator.update_attribute( :game_action_id, new_action.id )
      old_action.destroy
    end
    redirect_to game_board_investigators_url( @current_game_board )
  end

end