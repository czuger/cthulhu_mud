module InvestigatorsHelper

  def destination( travel )
    destination = travel.place_to
    if destination
      ( destination.full_description_name ).capitalize
    end
  end

end
