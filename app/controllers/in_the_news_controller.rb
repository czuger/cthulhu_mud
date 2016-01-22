class InTheNewsController < ApplicationController
  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @in_the_news_places = @current_game_board.in_the_news_places
  end
end
