class GameActionLog < ActiveRecord::Base
  belongs_to :investigator
  belongs_to :action_location, class_name: 'Place', foreign_key: :action_location_id
  belongs_to :result_location, class_name: 'Place', foreign_key: :result_location_id
end
