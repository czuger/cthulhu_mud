FactoryGirl.define do
  factory :game_action do
    transient do
      arkham { Place.find_by_name('Arkham') || create(:arkham) }
      arkham_to_kingsport { Travel.find_by_place_from_id( arkham ) || create(:arkham_to_kingsport) }
    end
    factory :waiting do
      type 'Ga::Waiting'
      location {arkham}
    end
    factory :movement do
      type 'Ga::Movement'
      travel {arkham_to_kingsport}
      start_time { Time.now }
    end
    factory :ask_people do
      type 'Ga::AskPeople'
      location {arkham}
      start_time { Time.now - 5000 }
    end
    factory :investigate do
      type 'Ga::Investigate'
      location {arkham}
      start_time { Time.now - 5000 }
    end
  end
end
