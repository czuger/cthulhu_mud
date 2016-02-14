class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :items, :places, table_name: :items_can_be_found_at_places do |t|
       t.index :item_id
       t.index [:place_id, :item_id], unique: true
    end
  end
  add_foreign_key :items_can_be_found_at_places, :items
  add_foreign_key :items_can_be_found_at_places, :places
end
