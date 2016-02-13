class AddDestinationIdToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :destination_id, :integer
    add_foreign_key :investigators, :places, column: :destination_id
  end
end
