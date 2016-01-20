module InvestigatorsHelper

  def news_info( in_the_news )
    place = in_the_news.place
    headline = in_the_news.in_the_news_headline.headline
    "#{headline} #{place.name.downcase} in #{place.parent.name}"
  end

end
