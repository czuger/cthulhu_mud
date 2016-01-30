class RemoveNameFromPlace < ActiveRecord::Migration
  def change
    remove_column :places, :name, :string
  end
end
