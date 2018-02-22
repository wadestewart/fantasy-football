class RenameColumnInPlayers < ActiveRecord::Migration[5.1]
  def change
    rename_column :players, :first_name, :name
  end
end
