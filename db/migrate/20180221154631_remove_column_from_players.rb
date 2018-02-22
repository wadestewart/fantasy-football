class RemoveColumnFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :last_name, :string
  end
end
