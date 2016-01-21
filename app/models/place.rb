class Place < ActiveRecord::Base

  has_closure_tree
  has_many :game_actions, dependent: :destroy, foreign_key: :location_id

  has_many :travels, foreign_key: :place_from_id
  has_many :neighbours, class_name: 'Place', foreign_key: :place_to_id, through: :travels, source: :place_to

end
