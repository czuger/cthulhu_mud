class AddMadAndDeadToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :mad, :boolean, null: false, default: false
    add_column :investigators, :dead, :boolean, null: false, default: false
  end
end
