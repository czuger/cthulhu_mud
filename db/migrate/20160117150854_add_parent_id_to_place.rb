class AddParentIdToPlace < ActiveRecord::Migration
  def change
    add_column :places, :parent_id, :integer
  end
end
