class AddCluesToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :clues, :integer, null: false, default: 0
  end
end
