class GamePlayer < ApplicationRecord
  include PlayerModule

  belongs_to :game
  belongs_to :player

  serialize :hand, type: Array, coder: CardCoder

  def self.create_with_player(player:, game: nil)
    game ||= Game.new
    game_player = GamePlayer.new
    game_player.game = game
    game_player.player = player
    game_player.save
    game_player.update!(hand: [ game.deck.deal, game.deck.deal ])
    game_player
  end

  def set_ante!(ante:)
    self.update!(bet: ante)
  end
end
