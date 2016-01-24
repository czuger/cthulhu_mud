class CreateGameBoardLogs < ActiveRecord::Migration
  def change
    create_table :game_board_logs do |t|
      t.references :game_board, index: true, foreign_key: true, null: false
      t.string :presage, null: false
      t.integer :portal_count, null: false
      t.integer :final_destiny, null: false

      t.timestamps null: false
    end
  end
end
