class GenderNotNullInPlace < ActiveRecord::Migration
  def change
    change_column_null :places, :gender, false
  end
end
