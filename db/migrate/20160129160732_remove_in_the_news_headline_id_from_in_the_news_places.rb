class RemoveInTheNewsHeadlineIdFromInTheNewsPlaces < ActiveRecord::Migration
  def change
    remove_column :in_the_news_places, :in_the_news_headline_id, :integer
    change_column_null :in_the_news_places, :headline_code, false
    drop_table :in_the_news_headlines
  end
end
