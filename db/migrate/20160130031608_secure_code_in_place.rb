class SecureCodeInPlace < ActiveRecord::Migration
  def change
    change_column_null :places, :code, false
    change_column_null :places, :default_translation, false
  end
end
