class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer :place_from_id, null: false
      t.integer :place_to_id, null: false
      t.float :cost, null: false, default: 0
      t.time :duration, null: false

      t.timestamps null: false
    end
  end
end
