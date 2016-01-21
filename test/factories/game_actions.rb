FactoryGirl.define do
  factory :game_action do
    factory :waiting do
      type 'Ga::Waiting'
      location factory: :arkham
    end
  end
end
