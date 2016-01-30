class MonsterOnBoard < ActiveRecord::Base
  belongs_to :game_board
  belongs_to :monster
  belongs_to :place
end
