module TravelsHelper

  def travel_destination( travel )
    name_with_ancestors( travel.place_to )
  end

end
