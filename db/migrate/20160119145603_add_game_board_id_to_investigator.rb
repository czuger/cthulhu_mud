class AddGameBoardIdToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :game_board_id, :integer
  end
end
