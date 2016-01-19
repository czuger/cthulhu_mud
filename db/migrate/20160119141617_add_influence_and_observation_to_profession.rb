class AddInfluenceAndObservationToProfession < ActiveRecord::Migration
  def change
    add_column :professions, :influence, :integer
    add_column :professions, :observation, :integer
  end
end
