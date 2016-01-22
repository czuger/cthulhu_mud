class AddDiscoveredToPortal < ActiveRecord::Migration
  def change
    add_column :portals, :discovered, :boolean, null: false, default: false
  end
end
