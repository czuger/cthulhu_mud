json.array!(@in_the_news_headlines) do |in_the_news_headline|
  json.extract! in_the_news_headline, :id, :headline
  json.url in_the_news_headline_url(in_the_news_headline, format: :json)
end
