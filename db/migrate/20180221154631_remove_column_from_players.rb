class RemoveColumnFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :last_name, :string
    remove_column :players, :img, :string
  end
end
