class AddProfessionIdToInvestigator < ActiveRecord::Migration
  def change
    add_column :investigators, :profession_id, :integer
  end
end
