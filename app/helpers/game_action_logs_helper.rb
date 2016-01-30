module GameActionLogsHelper

  def current_location_name( log )
    @action_location = log.action_location
    if @action_location
      @action_location.full_localisation_name
    end
  end

  def result_location_name(log )
    location = log.result_location
    if location
      location.full_localisation_name
    end
  end

end
