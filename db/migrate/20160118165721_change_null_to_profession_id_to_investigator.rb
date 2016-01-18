class ChangeNullToProfessionIdToInvestigator < ActiveRecord::Migration
  def change
    change_column_null :investigators, :profession_id, false
  end
end
