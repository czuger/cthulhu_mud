class InTheNewsController < ApplicationController

  include InvestigatorsActions::ClueFinding

  def show
    @current_game_board = GameBoard.find(params[:game_board_id] )
    @in_the_news_places = in_the_news_places
  end
end
