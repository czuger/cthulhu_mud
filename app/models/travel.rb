class Travel < ActiveRecord::Base

  belongs_to :place_from, class_name: 'Place'
  belongs_to :place_to, class_name: 'Place'

end
