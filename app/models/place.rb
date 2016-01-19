class Place < ActiveRecord::Base

  has_closure_tree
  has_many :investigators, dependent: :destroy, foreign_key: :location_id

end
