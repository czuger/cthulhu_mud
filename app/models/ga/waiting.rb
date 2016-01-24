class Ga::Waiting < GameAction

  def print_action_data
    {
      location_to_print: 'Waiting at ' + location.name_with_ancestors, action: :waiting
    }
  end

  def movement_possibilities
    Travel.where( place_from_id: location_id )
  end

  def move_to( travel )
    ActiveRecord::Base.transaction do
      new_action = Ga::Movement.create( travel_id: travel.id, start_time: Time.now )
      investigator.update_attribute( :game_action_id, new_action.id )
      self.destroy
    end
  end

  def ask_people
    action_after_waiting( 'Ga::AskPeople' )
  end

  def investigate
    action_after_waiting( 'Ga::Investigate' )
  end

  def find_portal
    action_after_waiting( 'Ga::FindPortal' )
  end

  def close_portal
    action_after_waiting( 'Ga::ClosePortal' )
  end

  private

  def action_after_waiting( class_name )
    ActiveRecord::Base.transaction do
      new_action = class_name.constantize.create( location_id: location_id, start_time: Time.now )
      investigator.update_attribute( :game_action_id, new_action.id )
      self.destroy
    end
  end

end