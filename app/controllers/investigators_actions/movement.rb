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
      nodes = Travel.all.pluck( :place_from_id, :place_to_id ).map{ |t| [ t.first, t.last ] }.uniq
      graph = build_graph( nodes )
      pp graph
      sp = shortest_path( graph, @investigator.game_action.location_id, @investigator.destination_id )
      pp sp
      next_step = get_next_step( sp )
      next_step_travel = Travel.find_by_place_from_id_and_place_to_id( @investigator.game_action.location_id, next_step )
      @investigator.game_action.move_to( next_step_travel ) if next_step_travel
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

  def build_graph( nodes )
    g = {}
    nodes.each do |node|
      unless g[ node[ 0 ] ]
        g[ node[ 0 ] ] = []
      end
      g[ node[0] ] << node[ 1 ]
    end
    g
  end

  def shortest_path( graph, start, goal )

    # find path
    frontier = []
    frontier << start
    came_from = {}
    came_from[ start ] = nil

    while ! frontier.empty? do
      current = frontier.shift
      break if current == goal

      graph[ current ].each do |neighbor|
        unless came_from[ neighbor ]
          frontier << neighbor
          came_from[ neighbor ] = current
        end
      end
    end

    # build path
    current = goal
    path = [ current ]
    while current != start
      current = came_from[ current ]
      path << current
    end

    path.reverse
  end

end