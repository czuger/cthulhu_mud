class AddDiscoveredClueToInTheNewsPlace < ActiveRecord::Migration
  def change
    add_column :in_the_news_places, :discovered_clue, :boolean, null: false, default: false
  end
end
