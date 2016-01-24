class AddTurnsToGameBoard < ActiveRecord::Migration
  def change
    add_column :game_boards, :turns, :integer, default: 0
    add_column :game_boards, :game_board_open, :boolean, default: true
    add_column :game_boards, :end_result, :string

    change_column_null :game_boards, :turns, false
    change_column_null :game_boards, :game_board_open, false
  end
end
