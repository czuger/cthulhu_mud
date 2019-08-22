FactoryBot.define do
  factory :place do
    gender { :p }
    factory :arkham do
      code { 'arkham' }
      default_translation { 'Arkham' }
    end
    factory :kingsport do
      code { 'kingsport' }
      default_translation { 'Kingsport' }
    end
    factory :asylum do
      code { 'asylum' }
      default_translation { 'Asylum' }
      parent_id { Place.find_by( code: 'arkham' ) }
    end
    factory :hopital_sainte_marie do
      code { 'hopital_sainte_marie' }
      default_translation { 'hopital_sainte_marie' }
      parent_id { Place.find_by( code: 'arkham' ) }
    end
  end
end
