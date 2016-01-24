namespace :game do
  desc "Call next turn on all boards"
  task :next_turn => :environment do
    GameBoard.where( started: true, game_board_open: true ).each do |game_board|
      game_board.next_turn
    end
  end
end