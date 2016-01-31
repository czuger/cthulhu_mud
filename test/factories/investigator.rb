FactoryGirl.define do
  factory :investigator do
    factory :teddy_smith do
      name 'Teddy Smith'
      gender 'm'
      profession factory: :private
      influence 4
      observation 4
      game_action factory: :combat_monster
    end
    factory :graham_bell do
      name 'Graham Bell'
      gender 'm'
      profession factory: :private
      influence 2
      observation 4
      game_action factory: :waiting
    end
    factory :allyson_masley do
      name 'Allyson Masley'
      gender 'f'
      profession factory: :writer
      influence 4
      observation 2
      game_action factory: :movement
    end
    factory :george_bigot do
      name 'George Bigot'
      gender 'f'
      profession factory: :writer
      influence 4
      observation 2
      game_action factory: :ask_people
    end
    factory :benot_lerouge do
      name 'Benot Lerouge'
      gender 'f'
      profession factory: :writer
      influence 4
      observation 4
      game_action factory: :investigate
    end
  end
end
