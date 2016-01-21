class Ga::Waiting < GameAction

  def print_action
    'Waiting at ' + place_name_with_ancestors( location )
  end

  def movement_possibilities
    Travel.where( place_from_id: location_id )
  end

end