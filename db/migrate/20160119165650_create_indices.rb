class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.references :game_board, index: true, foreign_key: true, null: false
      t.references :place, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
