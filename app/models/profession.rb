class Profession < ActiveRecord::Base

  belongs_to :start_place, class_name: 'Place'
  has_many :investigators, dependent: :destroy

end
