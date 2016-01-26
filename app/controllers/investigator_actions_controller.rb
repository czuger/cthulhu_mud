class InvestigatorActionsController < ApplicationController

  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @investigator = Investigator.find( params[:id] || params[:investigator_id] )
    @investigator.game_action.check_action
    @log = @current_game_board.game_board_logs.limit( 5 )
  end

end
