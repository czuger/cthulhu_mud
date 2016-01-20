class RenameIndiceToClue < ActiveRecord::Migration
  def change
    rename_table :indices, :clues
  end
end
