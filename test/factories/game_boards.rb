FactoryGirl.define do

  factory :game_board do

    destiny 15
    current_presage :comet
    next_presage :eclipse

    after(:create) do |game_board|
      create( :arkham_to_kingsport )
      create( :graham_bell, game_board: game_board, )
      create( :allyson_masley, game_board: game_board )
      create( :george_bigot, game_board: game_board )
      create( :in_the_news_place, game_board: game_board )
    end

  end

end
