FactoryGirl.define do

  factory :game_board do

    destiny 15
    current_presage :comet
    next_presage :eclipse

    after(:create) do |game_board|
      create( :arkham_to_kingsport )
      create( :graham_bell, game_board: game_board, )
      create( :allyson_masley, game_board: game_board )
      create( :in_the_news_place, game_board: game_board )
      create( :asylum )
      create( :hopital_sainte_marie )
      monster = create( :monster )
      # At least a monster can be created everywhere
      Place.all.each do |place|
        place.monsters << Monster.first
      end

    end

  end

end
