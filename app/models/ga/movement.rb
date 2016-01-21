class Ga::Movement < GameAction

  belongs_to :travel, class_name: 'Travel', foreign_key: :travel_id

  def print_action_data
    travel_eta_int = travel_eta
    {
      location_to_print: 'On travel to ' + travel.place_to.name_with_ancestors + '. Eta ' ,
      eta_int: travel_eta_int, eta_str: Time.at( travel_eta ).utc.strftime( '%T' ),
      action: :movement
    }
  end

  def check_action
    wait if travel_eta <= 0
  end

  def wait
    ActiveRecord::Base.transaction do
      new_action = Ga::Waiting.create( location_id: travel.place_to_id, travel_id: nil, start_time: Time.now )
      investigator.update_attribute( :game_action_id, new_action.id )
      self.destroy
    end
  end

  private

  def travel_eta
    travel_time = Time.now - start_time
    duration = true_time( travel.duration ).to_i
    duration - travel_time
  end

  # Bring back all time object to utc epoch (required because of strange sqlite or active record management)
  def true_time( time_object )
    hours_to_sec = time_object.utc.hour * 60 * 60
    minutes_to_sec = time_object.utc.min * 60
    sec_to_sec = time_object.utc.sec
    hours_to_sec + minutes_to_sec + sec_to_sec
  end
end