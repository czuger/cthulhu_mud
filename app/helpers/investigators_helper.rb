module InvestigatorsHelper

  def destination( travel )
    destination = travel.place_to
    if destination
      ( destination.full_description_name )
    end
  end

  def neighbours( travel )
    destination = travel.place_to
    destination.neighbours.map{ |e| e.name_with_article }.sort.join( ', ')
  end

  def lead_to( travel )
    destination = travel.place_to
    lead_to_places = []
    neighbours = destination.neighbours.to_a
    destination.neighbours.each do |place|
      place.neighbours.each do |final_place|
        lead_to_places << final_place unless lead_to_places.include?( final_place ) || neighbours.include?( final_place )
      end
    end
    lead_to_places.map{ |e| e.name_with_article }.sort.join( ', ' )
  end

end
