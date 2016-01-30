class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :code, null: false
      t.string :default_translation, null: false
      t.integer :hit_points, null: false, default: 1
      t.integer :willpower_test, null: false, default: 0
      t.integer :horror, null: false, default: 1
      t.integer :combat_test, null: false, default: 0
      t.integer :damages, null: false, default: 1
      t.integer :apparition_weight, null: false, default: 1

      t.timestamps null: false
    end
  end
end
