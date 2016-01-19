FactoryGirl.define do
  factory :profession do
    factory :private do
      name "Private"
      start_place factory: :arkham
      influence 2
      observation 4
    end
  end
end
