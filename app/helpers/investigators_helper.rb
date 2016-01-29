module InvestigatorsHelper

  def news_info( in_the_news )
    place = in_the_news.place
    headline_str = I18n.t( 'news_headlines.' + in_the_news.headline_code )
    "#{headline_str} #{place.name.downcase}" + ( place.parent ? " in #{place.parent.name}" : '' )
  end

  def destination( travel )
    destination = travel.place_to
    if destination
      ( destination.name_with_article + ' ' + destination.parent_with_locative_prep ).capitalize
    end
  end

end
