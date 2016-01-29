class AddHeadlineCodeToInTheNewsPlace < ActiveRecord::Migration
  def change
    add_column :in_the_news_places, :headline_code, :string
  end
end
