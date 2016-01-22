FactoryGirl.define do

  factory :game_board do

    after(:create) do |game_board|
      travel = create( :arkham_to_kingsport )
      create( :investigator, main_location: 'toto', name: 'toto', gender: 'toto', profession_id: 5, influence: 5, observation: 5, game_board: game_board )
      create( :graham_bell, main_location: 'toto' )
      create( :allyson_masley, game_board: game_board, profession: private )
      create( :george_bigot, game_board: game_board, profession: private )
      create( :in_the_news_place, game_board: game_board )
    end

  end

end
