FactoryBot.define do
  factory :travel do
    transient do
      kingsport { Place.find_by_code('kingsport') || create(:kingsport) }
      arkham { Place.find_by_code('arkham') || create(:arkham) }
    end
    factory :arkham_to_kingsport do
      place_from_id { arkham.id }
      place_to_id { kingsport.id }
      duration {Time.now}
    end
  end
end
