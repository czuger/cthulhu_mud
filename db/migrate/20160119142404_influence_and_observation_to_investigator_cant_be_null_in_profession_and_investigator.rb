class InfluenceAndObservationToInvestigatorCantBeNullInProfessionAndInvestigator < ActiveRecord::Migration
  def change
    change_column_null :investigators, :influence, false
    change_column_null :investigators, :observation, false
    change_column_null :professions, :influence, false
    change_column_null :professions, :observation, false
  end
end
