FactoryGirl.define do
  factory :investigator do
    factory :graham_bell do
      name 'Graham Bell'
      gender 'm'
      location factory: :arkham
      profession factory: :private
      influence 2
      observation 4
    end
  end
end
