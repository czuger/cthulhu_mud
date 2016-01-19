FactoryGirl.define do

  factory :game_board do

    after(:create) do |game_board|
      create( :graham_bell, game_board: game_board )
    end

  end

end
