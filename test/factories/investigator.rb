FactoryGirl.define do
  factory :investigator do
    transient do
      kingsport { Place.find_by_code('kingsport') || create(:kingsport) }
    end

    influence 4
    observation 4
    gender 'm'
    clues 15

    factory :david_underhill do
      name 'David Underhill'
      profession factory: :private
      game_action factory: :find_portal
    end

    factory :winston_minsterhill do
      name 'Winston Minsterhill'
      profession factory: :private
      game_action factory: :close_portal
    end

    factory :teddy_smith do
      name 'Teddy Smith'
      profession factory: :private
      game_action factory: :combat_monster
    end

    factory :graham_bell do
      name 'Graham Bell'
      profession factory: :private
      game_action factory: :waiting
      destination_id { kingsport.id }
    end

    factory :allyson_masley do
      name 'Allyson Masley'
      gender 'f'
      profession factory: :writer
      game_action factory: :movement
    end

    factory :george_bigot do
      name 'George Bigot'
      profession factory: :writer
      game_action factory: :ask_people
    end

    factory :benot_lerouge do
      name 'Benot Lerouge'
      profession factory: :writer
      game_action factory: :investigate
    end

  end
end
