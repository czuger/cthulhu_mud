class Profession < ActiveRecord::Base

  belongs_to :start_place, class_name: 'Place'

end
