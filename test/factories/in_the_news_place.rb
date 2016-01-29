FactoryGirl.define do
  factory :in_the_news_place do
    transient do
      arkham { Place.find_by_name('Arkham') || create(:arkham) }
    end
    place {arkham}
    headline_code :stench
  end

end
