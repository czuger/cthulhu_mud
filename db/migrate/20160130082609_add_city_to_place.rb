class AddCityToPlace < ActiveRecord::Migration
  def change
    add_column :places, :city, :boolean
  end
end
