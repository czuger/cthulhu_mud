class AddGameActionIdToInvestigator < ActiveRecord::Migration
  def change
    add_reference :investigators, :game_action, index: true, foreign_key: true
  end
end
