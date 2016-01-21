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
  end
end
