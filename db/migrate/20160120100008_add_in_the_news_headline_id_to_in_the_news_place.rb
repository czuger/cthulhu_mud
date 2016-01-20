class AddInTheNewsHeadlineIdToInTheNewsPlace < ActiveRecord::Migration
  def change
    add_reference :in_the_news_places, :in_the_news_headline, index: true, foreign_key: true
  end
end
