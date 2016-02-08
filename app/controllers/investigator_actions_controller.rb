class InvestigatorActionsController < ApplicationController

  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @investigator = Investigator.find( params[:id] || params[:investigator_id] )
    @investigator.game_action.check_action
    @board_log = @current_game_board.game_board_logs.limit( 5 )
    @in_the_news_places = @current_game_board.in_the_news_places.sort_by{ |e| [ e.place.parent_id, e.id ] }
    @game_action_log = @investigator.game_action_logs.limit( 5 )
    @discovered_portals = @current_game_board.discovered_portals
    @monsters_in_place = MonsterOnBoard.where( place_id: @investigator.game_action.location_id, game_board_id: @current_game_board.id )
  end

end
