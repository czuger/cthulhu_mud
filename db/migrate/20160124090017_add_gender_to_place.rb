class AddGenderToPlace < ActiveRecord::Migration
  def change
    add_column :places, :gender, :string
  end
end
