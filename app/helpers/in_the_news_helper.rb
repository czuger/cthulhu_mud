module InTheNewsHelper

  def news_info( in_the_news )
    place = in_the_news.place
    headline_str = I18n.t( 'news_headlines.' + in_the_news.headline_code )
    "#{headline_str} #{place.full_localisation_name}"
  end

end
