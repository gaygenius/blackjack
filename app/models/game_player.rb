class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player

  def self.create_with_player(player:, game: nil, bet: 0)
    game ||= Game.new
    game_player = GamePlayer.new
    game_player.game = game
    game_player.player = player
    game_player.save
    game_player
  end
end
