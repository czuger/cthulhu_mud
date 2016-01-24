FactoryGirl.define do
  factory :place do
    gender :p
    sequence :name do |n|
      "Random place #{n}"
    end
    factory :arkham do
      name 'Arkham'
    end
    factory :kingsport do
      name 'Kingsport'
    end
  end
end
