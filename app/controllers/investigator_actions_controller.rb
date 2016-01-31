class InvestigatorActionsController < ApplicationController

  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @investigator = Investigator.find( params[:id] || params[:investigator_id] )
    @investigator.game_action.check_action
    @board_log = @current_game_board.game_board_logs.limit( 5 )
    @in_the_news_places = @current_game_board.in_the_news_places
    @game_action_log = @investigator.game_action_logs.limit( 5 )
    @discovered_portals = @current_game_board.discovered_portals
    discovered_clues = @investigator.game_board.game_action_logs.where( result_code: 'find_clue' ).map{ |e| e.action_location_id }
    in_the_news_places_ids = @in_the_news_places.map{ |e| e.place_id }
    @discovered_places_ids = in_the_news_places_ids & discovered_clues
    debug = 'dummy'
  end

end
