class PortalsController < ApplicationController

  def show
    @game_board = GameBoard.find( params[ :game_board_id ] )
    @places_with_discovered_portals = @game_board.places_with_discovered_portals
  end

end
