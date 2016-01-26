class AdminController < ApplicationController

  def start_admin
    session[ :admin ] = true
    redirect_to game_boards_path
  end

  def stop_admin
    session[ :admin ] = false
    redirect_to game_boards_path
  end

end