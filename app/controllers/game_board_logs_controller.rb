class GameBoardLogsController < ApplicationController
  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @board_log = @current_game_board.game_board_logs
  end
end
