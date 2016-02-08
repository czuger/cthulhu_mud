class Ga::FindPortal < Ga::BaseAction

  def set_action_result
    clues_count = investigator.clues

    if clues_count >= 2
      portal = investigator.game_board.undiscovered_portals.sample
      if portal
        ActiveRecord::Base.transaction do
          portal.update_attribute( :discovered, true )
          investigator.update_attribute( :clues, investigator[ :clues ] - 2 )
        end
        @action_result = :portal_discovered
      else
        @action_result = :no_portals
      end
    else
      @action_result = :not_enough_clues
    end
  end

  def get_action_name
    :find_portal
  end

end