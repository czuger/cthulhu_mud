module GameBoardSetting::CluesGeneration

  private

  def generate_clues
    cleanup_places_in_the_news

    places_with_indices_ids = @game_board.clues.map{ |e| e.place_id }
    avaliable_places = Place.leaves.reject{ |p| places_with_indices_ids.include?( p.id ) }.shuffle

    nb_indices_per_turn = ( @game_board.investigators.count.to_f / 2.0 ).ceil

    1.upto( nb_indices_per_turn ).each do
      place = avaliable_places.shift
      break unless place
      @game_board.places_where_there_are_clues << place
    end

    set_indices_places_in_the_news
  end

  def cleanup_places_in_the_news
    @game_board.in_the_news_places.each do |itnp|
      unless Clue.find_by_game_board_id_and_place_id( @game_board.id, itnp.place_id )
        itnp.destroy
      end
    end
  end

  def set_indices_places_in_the_news
    max_clues = @game_board.investigators.count - @game_board.places_where_the_news_says_there_are_clues.count
    clues_places = @game_board.places_where_there_are_clues.shuffle
    clues_places = clues_places.shift( max_clues )
    headlines = InTheNewsHeadline.all

    clues_places.each do |place|
      next if InTheNewsPlace.find_by_game_board_id_and_place_id( @game_board.id, place.id )
      if rand( 100 ) > 20
        # The information is good, the clue is at the right place
        # @game_board.places_where_the_news_says_there_are_clues << place
        InTheNewsPlace.create(
          game_board_id: @game_board.id, place_id: place.id, in_the_news_headline_id: headlines.sample.id )
      else
        # The information is not at the right place.
        # We find a place near.
        neighbour = place.neighbours.sample
        puts place.inspect
        # @game_board.places_where_the_news_says_there_are_clues << neighbour
        puts headlines.inspect
        InTheNewsPlace.create(
          game_board_id: @game_board.id, place_id: place.id, in_the_news_headline_id: headlines.sample.id )

      end
    end
  end

end