module InvestigatorsHelper

  def show_place( investigator )
      if investigator.location_id
        name_with_ancestors( investigator.location )
      else
        puts investigator.inspect
        destination_name = name_with_ancestors( investigator.travel.place_to )
        time = Time.now - investigator.travel_start_time
        "On travel to #{destination_name}, ETA : #{time}"
      end
  end

end
