FactoryGirl.define do
  factory :profession do
    factory :private do
      name "Private"
      start_place factory: :arkham
      influence 2
      observation 4
    end
    factory :writer do
      name "Writer"
      start_place factory: :arkham
      influence 4
      observation 2
    end
  end
end
