class CreateInTheNewPlaces < ActiveRecord::Migration
  def change
    create_table :in_the_new_places do |t|
      t.references :game_board, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
