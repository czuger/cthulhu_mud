class GameActionLogsController < ApplicationController

  def show
    set_current_game_board
    set_investigator
    @investigator.game_action.check_action
    @log = @investigator.game_action_logs
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_investigator
    @investigator = Investigator.find( params[:id] || params[:investigator_id] )
  end

  def set_current_game_board
    @current_game_board = GameBoard.find(params[:game_board_id] )
  end

end
