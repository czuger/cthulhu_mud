module GameBoardSetting::TurnManagement

  include GameBoardSetting::CluesGeneration

  def start_game
    unless @game_board.started
      generate_clues
      @game_board.update_attribute( :started, true )
    end
    redirect_to game_board_investigators_path( @game_board )
  end

  def next_turn
    generate_clues
    redirect_to game_board_investigators_path( @game_board )
  end
end