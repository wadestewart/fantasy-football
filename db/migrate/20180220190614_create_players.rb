class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string      :first_name
      t.string      :last_name
      t.string      :nfl_team
      t.string      :position
      t.string      :img
      t.integer     :rank
      t.references  :team
    end
  end
end
