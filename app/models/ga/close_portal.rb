class Ga::ClosePortal < Ga::AskPeople

  def set_action_result
    clues_count = investigator.clues

    if clues_count >= 3
      portal = Portal.find_by_game_board_id_and_place_id( investigator.game_board_id, location_id )
      if portal
        ActiveRecord::Base.transaction do
          portal.destroy
          investigator.update_attribute( :clues, investigator[ :clues ] - 2 )
        end
        @action_result = :portal_closed
      else
        @action_result = :no_portal
      end
    else
      @action_result = :not_enough_clues
    end
  end

  def get_action_name
    :close_portal
  end

end