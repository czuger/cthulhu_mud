class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code, null: false
      t.string :default_translation, null: false
      t.integer :influence, null: false, default: 0
      t.integer :observation, null: false, default: 0
      t.integer :will, null: false, default: 0
      t.integer :combat, null: false, default: 0
      t.integer :cost, null: false, default: 1

      t.timestamps null: false
    end
    add_index :items, :code, unique: true
  end
end
