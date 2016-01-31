class AddVariablesToProfession < ActiveRecord::Migration
  def change
    add_column :professions, :sanity, :integer, default: 5
    add_column :professions, :stamina, :integer, default: 5
    add_column :professions, :will, :integer, default: 2
    add_column :professions, :combat, :integer, default: 2
    add_column :investigators, :sanity, :integer, default: 5
    add_column :investigators, :stamina, :integer, default: 5
    add_column :investigators, :will, :integer, default: 2
    add_column :investigators, :combat, :integer, default: 2

    change_column_null :professions, :sanity, false
    change_column_null :professions, :stamina, false
    change_column_null :professions, :will, false
    change_column_null :professions, :combat, false
    change_column_null :investigators, :sanity, false
    change_column_null :investigators, :stamina, false
    change_column_null :investigators, :will, false
    change_column_null :investigators, :combat, false
  end
end
