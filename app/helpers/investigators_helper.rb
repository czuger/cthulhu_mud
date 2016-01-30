module InvestigatorsHelper

  def destination( travel )
    destination = travel.place_to
    if destination
      ( destination.name_with_article + ' ' + destination.parent_with_locative_prep ).capitalize
    end
  end

end
