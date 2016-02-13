module InTheNewsHelper

  def news_info( in_the_news )
    place = in_the_news.place
    headline_str = I18n.t( 'news_headlines.' + in_the_news.headline_code )
    "#{headline_str} #{place.full_localisation_name}"
  end

  def target_travel_class( in_the_news )
    # if @investigator&.destination_id == in_the_news.place_id
    if @investigator && @investigator_id == in_the_news.place_id
      :target_travel
    elsif @other_destinations_targeted_by_investigator.include?( in_the_news.place_id )
      :other_investigator_target_travel
    end
  end

end
