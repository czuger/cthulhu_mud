module GameActionLogsHelper

  def current_location_name(log )
    @action_location = log.action_location
    if @action_location
      @action_location.name_with_partitive_article + ' ' + @action_location.parent_with_locative_prep
    end
  end

  def result_location_name(log )
    location = log.result_location
    if location
      dry_location = (location.parent_id == @action_location.parent_id) ? '' : ' ' + location.parent_with_locative_prep
      location.name_with_partitive_article + dry_location
    end
  end

end
