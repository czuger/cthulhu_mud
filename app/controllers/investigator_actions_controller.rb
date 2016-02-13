class InvestigatorActionsController < ApplicationController

  include InvestigatorsActions::ClueFinding

  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @investigator = Investigator.find( params[:id] || params[:investigator_id] )
    @investigator.game_action.check_action
    @game_action_log = @investigator.game_action_logs.limit( 5 )
    @discovered_portals = @current_game_board.discovered_portals
    @monsters_in_place = MonsterOnBoard.where( place_id: @investigator.game_action.location_id, game_board_id: @current_game_board.id )
    setup_in_the_news_places
  end

end
