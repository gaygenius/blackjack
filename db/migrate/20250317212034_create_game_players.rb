class CreateGamePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :game_players do |t|
      t.references :game, null: false
      t.references :player, null: false

      t.timestamps
    end
  end
end
