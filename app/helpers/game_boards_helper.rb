module GameBoardsHelper

  def next_turn_link
    if @current_game_board.started
      link_to 'Next turn', game_board_next_turn_path( @current_game_board )
    else
      link_to 'Start game', game_board_start_game_path( @current_game_board )
    end
  end

end

