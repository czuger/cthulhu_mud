class GameAction < ActiveRecord::Base
  has_one :investigator
  belongs_to :location, class_name: 'Place', foreign_key: :location_id

  private

  def place_name_with_ancestors( place )
    ( [ place.name ] + place.ancestors.map{ |e| e.name } ).join( ' - ' )
  end

end
