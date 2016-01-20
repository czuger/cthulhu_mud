class AddStartedToGameBoard < ActiveRecord::Migration
  def change
    add_column :game_boards, :started, :boolean
  end
end
