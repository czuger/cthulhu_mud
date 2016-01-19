class CreateGameBoards < ActiveRecord::Migration
  def change
    create_table :game_boards do |t|

      t.timestamps null: false
    end
  end
end
