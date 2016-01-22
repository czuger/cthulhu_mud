FactoryGirl.define do
  factory :investigator do
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
  end
end