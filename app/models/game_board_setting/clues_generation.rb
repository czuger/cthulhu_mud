module GameBoardSetting::CluesGeneration

  PER_INVESTIGATOR_PER_TURN_CLUE_GENERATION = 1

  private

  def generate_clues
    cleanup_places_in_the_news

    places_with_indices_ids = clues.map{ |e| e.place_id }
    avaliable_places = Place.leaves.reject{ |p| places_with_indices_ids.include?( p.id ) }.shuffle

    nb_indices_per_turn = ( investigators.count.to_f * PER_INVESTIGATOR_PER_TURN_CLUE_GENERATION ).ceil

    1.upto( nb_indices_per_turn ).each do
      place = avaliable_places.shift
      break unless place
      places_where_there_are_clues << place
    end

    set_indices_places_in_the_news
  end

  def cleanup_places_in_the_news
    in_the_news_places.each do |itnp|
      unless Clue.find_by_game_board_id_and_place_id( id, itnp.place_id )
        itnp.destroy
      end
    end
  end

  def set_indices_places_in_the_news
    max_clues = investigators.count - places_where_the_news_says_there_are_clues.count
    clues_places = places_where_there_are_clues.shuffle
    clues_places = clues_places.shift( max_clues )
    headlines = InTheNewsHeadline.all

    clues_places.each do |place|
      next if InTheNewsPlace.find_by_game_board_id_and_place_id( id, place.id )
      if rand( 100 ) > 20
        # The information is good, the clue is at the right place
        # @game_board.places_where_the_news_says_there_are_clues << place
        InTheNewsPlace.create(
          game_board_id: id, place_id: place.id, in_the_news_headline_id: headlines.sample.id )
      else
        # The information is not at the right place.
        # We find a place near.
        neighbour = place.neighbours.sample
        # @game_board.places_where_the_news_says_there_are_clues << neighbour
        InTheNewsPlace.create(
          game_board_id: id, place_id: place.id, in_the_news_headline_id: headlines.sample.id )

      end
    end
  end

end