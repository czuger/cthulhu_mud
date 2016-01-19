class ChangeNullToGameBoardIdToInvestigator < ActiveRecord::Migration
  def change
    change_column_null :investigators, :game_board_id, false
  end
end
