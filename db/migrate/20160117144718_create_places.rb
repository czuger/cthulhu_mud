class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :city_id
      t.boolean :city

      t.timestamps null: false
    end
  end
end
