class EnforceInTheNewsPlace < ActiveRecord::Migration
  def change
    change_column_null :in_the_news_places, :game_board_id, false
    change_column_null :in_the_news_places, :place_id, false
    change_column_null :in_the_news_places, :in_the_news_headline_id, false

    add_foreign_key :in_the_news_places, :game_board
    add_foreign_key :in_the_news_places, :place
    add_foreign_key :in_the_news_places, :in_the_news_headline
  end
end
