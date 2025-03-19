class GamePlayer < ApplicationRecord
  belongs_to :game, dependent: :destroy
  belongs_to :player

  serialize :hand, type: Array, coder: CardCoder

  def self.create_with_player(player:, game: nil)
    game ||= Game.new
    game_player = GamePlayer.new
    game_player.game = game
    game_player.player = player
    game_player.save
    game_player
  end

  def start_game
    self.update!(hand: [self.game.deck.deal, self.game.deck.deal])
  end
end
