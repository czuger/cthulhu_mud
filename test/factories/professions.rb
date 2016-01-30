FactoryGirl.define do
  factory :profession do
    transient do
      arkham { Place.find_by_code('arkham') || create(:arkham) }
    end
    factory :private do
      name "Private"
      start_place {arkham}
      influence 2
      observation 4
    end
    factory :writer do
      name "Writer"
      start_place {arkham}
      influence 4
      observation 2
    end
  end
end
