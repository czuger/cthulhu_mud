FactoryGirl.define do
  factory :place do
    gender :p
    factory :arkham do
      code 'arkham'
      default_translation 'Arkham'
    end
    factory :kingsport do
      code 'kingsport'
      default_translation 'Kingsport'
    end
  end
end
