class CreateInvestigators < ActiveRecord::Migration
  def change
    create_table :investigators do |t|
      t.string :name, null: false
      t.integer :location_id, null: false

      t.timestamps null: false
    end
  end
end
