class CreateGameActions < ActiveRecord::Migration
  def change
    create_table :game_actions do |t|
      t.string :type
      t.integer :location_id
      t.integer :travel_id
      t.datetime :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
