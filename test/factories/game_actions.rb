FactoryBot.define do
  factory :game_action do
    transient do
      arkham { Place.find_by_code('arkham') || create(:arkham) }
      arkham_to_kingsport { Travel.find_by_place_from_id( arkham ) || create(:arkham_to_kingsport) }
    end
    factory :waiting do
      type { 'Ga::Waiting' }
      location {arkham}
    end
    factory :movement do
      type { 'Ga::Movement' }
      travel {arkham_to_kingsport}
      start_time { Time.now }
    end
    factory :ask_people do
      type { 'Ga::AskPeople' }
      location {arkham}
      start_time { Time.now - 5000 }
    end
    factory :investigate do
      type { 'Ga::Investigate' }
      location {arkham}
      start_time { Time.now - 5000 }
    end
    factory :combat_monster do
      type { 'Ga::CombatMonster' }
      location {arkham}
      start_time { Time.now - 5000 }
    end
    factory :close_portal do
      type { 'Ga::ClosePortal' }
      location {arkham}
      start_time { Time.now - 5000 }
    end
    factory :find_portal do
      type { 'Ga::FindPortal' }
      location {arkham}
      start_time { Time.now - 5000 }
    end
  end
end
