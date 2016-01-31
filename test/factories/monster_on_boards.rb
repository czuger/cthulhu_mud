FactoryGirl.define do
  factory :monster_on_board do
    transient do
      arkham { Place.find_by_code('arkham') || create(:arkham) }
    end
    game_board nil
    monster { Monster.first }
    place { arkham }
    hit_points 1
  end

end
