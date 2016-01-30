class AddCodeToPlace < ActiveRecord::Migration
  def change
    add_column :places, :code, :string
    add_column :places, :default_translation, :string
  end
end
