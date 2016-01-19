class AddInfluenceAndObservationToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :influence, :integer
    add_column :investigators, :observation, :integer
  end
end
