namespace :game do

  desc "Call next turn on all boards"
  task :next_turn => :environment do
    GameBoard.where( started: true, game_board_open: true ).each do |game_board|
      game_board.next_turn
    end
  end

  desc "Call next turn on all boards (every 5 minutes)"
  task :next_turn_loop => :environment do
    wait_time = 5 * 60
    while true
      puts "Waiting for #{wait_time.to_f / 60.0} minutes"
      sleep( wait_time )
      puts 'Compute next turn for all boards'
      GameBoard.where( started: true, game_board_open: true ).each do |game_board|
        game_board.next_turn
      end
    end
  end
end