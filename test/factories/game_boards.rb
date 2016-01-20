FactoryGirl.define do

  factory :game_board do

    after(:create) do |game_board|
      create( :graham_bell, game_board: game_board )
      create( :in_the_news_headline )
    end

  end

end
