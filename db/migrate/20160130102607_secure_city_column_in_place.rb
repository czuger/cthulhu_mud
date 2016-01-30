class SecureCityColumnInPlace < ActiveRecord::Migration
  def change
    change_column_default(:places, :city, false)
    change_column_null(:places, :city, false)
  end
end
