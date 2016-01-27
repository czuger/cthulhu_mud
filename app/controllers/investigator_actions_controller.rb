class InvestigatorActionsController < ApplicationController

  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @investigator = Investigator.find( params[:id] || params[:investigator_id] )
    @investigator.game_action.check_action
    @board_log = @current_game_board.game_board_logs.limit( 5 )
    @in_the_news_places = @current_game_board.in_the_news_places
    @game_action_log = @investigator.game_action_logs.limit( 5 )
    @places_with_discovered_portals = @current_game_board.places_with_discovered_portals
  end

end
