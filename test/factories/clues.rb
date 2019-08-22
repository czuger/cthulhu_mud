FactoryBot.define do
  factory :clue do
    game_board { nil }
    place factory: :arkham
  end
end
