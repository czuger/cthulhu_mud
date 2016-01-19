class GameBoard < ActiveRecord::Base

  has_many :investigators, dependent: :destroy

end
