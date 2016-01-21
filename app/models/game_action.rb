class GameAction < ActiveRecord::Base
  has_one :investigator
  belongs_to :location, class_name: 'Place', foreign_key: :location_id
  belongs_to :travel, class_name: 'Travel', foreign_key: :travel_id

  def check_action
    # Default check action is nothing : will be overloaded by some actions.
  end

end
