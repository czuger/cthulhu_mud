FactoryBot.define do
  factory :in_the_news_place do
    transient do
      arkham { Place.find_by_code('arkham') || create(:arkham) }
    end
    place {arkham}
    headline_code { :stench }
    after(:create) do |in_the_news_place|
      Clue.new( place_id: in_the_news_place.place_id, game_board_id: in_the_news_place.game_board_id )
    end
  end

end
