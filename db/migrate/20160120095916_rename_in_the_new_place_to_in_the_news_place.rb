class RenameInTheNewPlaceToInTheNewsPlace < ActiveRecord::Migration
  def change
    rename_table :in_the_new_places, :in_the_news_places
  end
end
