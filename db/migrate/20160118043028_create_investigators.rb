class CreateInvestigators < ActiveRecord::Migration
  def change
    create_table :investigators do |t|
      t.string :name, null: false
      t.string :gender, null: false

      t.integer :location_id
      t.integer :travel_id
      t.timestamp :travel_start_time

      t.timestamps null: false
    end
  end
end
