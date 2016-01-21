class DropDurationFromGameAction < ActiveRecord::Migration
  def change
    remove_column :game_actions, :duration
  end
end
