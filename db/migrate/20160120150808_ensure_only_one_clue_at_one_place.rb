class EnsureOnlyOneClueAtOnePlace < ActiveRecord::Migration
  def change
    add_index :clues, [ :game_board_id, :place_id ], unique: true
    add_index :in_the_news_places, [ :game_board_id, :place_id ], unique: true
  end
end
