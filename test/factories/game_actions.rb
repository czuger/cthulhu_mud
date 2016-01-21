FactoryGirl.define do
  factory :game_action do
    factory :waiting do
      type 'Ga::Waiting'
      location factory: :arkham
    end
    factory :movement do
      type 'Ga::Movement'
      travel factory: :arkham_to_kingsport
      start_time { Time.now }
    end
  end
end
