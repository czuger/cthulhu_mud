class Ga::Movement < GameAction

  belongs_to :travel, class_name: 'Travel', foreign_key: :travel_id

  def print_action
  'On travel to ' + name_with_ancestors( travel.place_to ) + ' eta - '
    + "<span eta ='#{travel_eta}' class='eta_show_area' id='eta_show_area#{id}'>"
    + Time.at( travel_eta ).utc.strftime( '%T' ) + '</span>'
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