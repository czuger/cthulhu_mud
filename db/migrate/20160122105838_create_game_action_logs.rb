class CreateGameActionLogs < ActiveRecord::Migration
  def change
    create_table :game_action_logs do |t|
      t.references :investigator, index: true, foreign_key: true, null: false
      t.string :action_type, null: false
      t.integer :action_location_id, null: false
      t.string :result_code, null: false
      t.integer :result_location_id

      t.timestamps null: false
    end
  end
end
