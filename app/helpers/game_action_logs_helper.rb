module GameActionLogsHelper

  def current_location_name(log )
    location = log.action_location
    if location
      location.name_with_partitive_article + ' ' + location.parent_with_locative_prep
    end
  end

  def result_location_name(log )
    location = log.result_location
    if location
      location.name_with_partitive_article + ' ' + location.parent_with_locative_prep
    end
  end

end
