class AddDestinyToGameBoard < ActiveRecord::Migration
  def change
    add_column :game_boards, :destiny, :integer
    add_column :game_boards, :current_presage, :string
    add_column :game_boards, :next_presage, :string

    change_column_null :game_boards, :destiny, false
    change_column_null :game_boards, :current_presage, false
    change_column_null :game_boards, :next_presage, false
  end
end
