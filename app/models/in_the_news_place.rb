class InTheNewsPlace < ActiveRecord::Base
  belongs_to :game_board
  belongs_to :place
end
