class CreateMonstersPlacesTable < ActiveRecord::Migration
  def change
    create_table :monsters_places do |t|
      t.references :monster, index: true, foreign_key: true, null: false
      t.references :place, index: true, foreign_key: true, null: false
    end
  end
end
