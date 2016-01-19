FactoryGirl.define do
  factory :travel do
    factory :arkham_to_kingsport do
      place_from factory: :arkham
      place_to factory: :kingsport
      duration Time.now
    end
  end
end
