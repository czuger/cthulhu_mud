require 'rgl/adjacency'
require 'rgl/dijkstra'
require 'pp'

module InvestigatorsActions::Movement

  include InvestigatorsActions::ClueFinding

  def movement_selection
    set_investigator
    @travels = @investigator.game_action.movement_possibilities
    setup_in_the_news_places
  end

  def move_start
    set_investigator
    travel = Travel.find( params[ :travel_destination ] )
    @investigator.game_action.move_to( travel )
    redirect_to game_board_investigators_url( @current_game_board )
  end

  def set_destination
    itnp = InTheNewsPlace.find( params[ :in_the_news_place_id ] )
    @investigator.update_attribute( :destination_id, itnp.place_id )
    redirect_to game_board_investigator_investigator_actions_path
  end

  def follow_path
    if @investigator.destination_id
      nodes = Travel.all.pluck( :place_from_id, :place_to_id ).map{ |t| [ t.first, t.last ] }.uniq.flatten
      dg = RGL::DirectedAdjacencyGraph[ *nodes ]
      pp dg
      sp = dg.dijkstra_shortest_path( Hash.new(1), @investigator.game_action.location_id, @investigator.destination_id )
      next_step = get_next_step( sp )
      next_step_place = Place.find( next_step )
      @investigator.game_action.move_to( next_step_place ) if next_step
      redirect_to game_board_investigators_url( @current_game_board )
    end
  end

  private

  def get_next_step( path )
    if path.length == 1
      path.first
    elsif path.length >= 2
      path[ 1 ]
    end
  end

end