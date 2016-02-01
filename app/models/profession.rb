class Profession < ActiveRecord::Base

  belongs_to :start_place, class_name: 'Place'
  has_many :investigators, dependent: :destroy

  COMP_POINTS = 10
  HEALTH_POINTS = 10

end
