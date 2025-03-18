class AddStateToGamePlayers < ActiveRecord::Migration[8.0]
  def change
    add_column :game_players, :hand, :text, default: [].to_yaml
    add_column :game_players, :bet, :integer, default: 0
  end
end
