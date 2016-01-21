class RemoveRubishFromInvestigator < ActiveRecord::Migration
  def change
    remove_column :investigators, :location_id
    remove_column :investigators, :travel_id
    remove_column :investigators, :travel_start_time
  end
end
