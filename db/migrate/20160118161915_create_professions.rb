class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name, null: false
      t.integer :start_place_id, null: false

      t.timestamps null: false
    end
  end
end
