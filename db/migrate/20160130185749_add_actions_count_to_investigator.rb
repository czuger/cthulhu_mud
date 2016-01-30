class AddActionsCountToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :actions_count, :integer
    change_column_default :investigators, :actions_count, 3
    change_column_null :investigators, :actions_count, false
  end
end
