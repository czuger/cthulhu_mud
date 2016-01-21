class GameAction < ActiveRecord::Base
  has_one :investigator
  belongs_to :location, class_name: 'Place', foreign_key: :location_id

  def check_action
    # Default check action is nothing : will be overloaded by some actions.
  end

end
