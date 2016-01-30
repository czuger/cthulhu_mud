class CreateMonsterOnBoards < ActiveRecord::Migration
  def change
    create_table :monster_on_boards do |t|
      t.references :game_board, index: true, foreign_key: true, null: false
      t.references :monster, index: true, foreign_key: true, null: false
      t.references :place, index: true, foreign_key: true, null: false
      t.integer :hit_points, null: false

      t.timestamps null: false
    end
  end
end
