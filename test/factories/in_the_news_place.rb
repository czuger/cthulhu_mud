FactoryGirl.define do
  factory :in_the_news_place do
    place factory: :arkham
    in_the_news_headline factory: :in_the_news_headline
  end

end
