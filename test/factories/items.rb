FactoryBot.define do
  factory :item do
    code { 'MyString' }
    default_translation { 'MyString' }
    influence { 1 }
    observation { 1 }
    will { 1 }
    combat { 1 }
    cost { 1 }
  end

end
