class AddWellKnownToPlace < ActiveRecord::Migration
  def change
    add_column :places, :well_known_place, :boolean, default: false, null: false
  end
end
