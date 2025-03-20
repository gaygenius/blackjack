class GamePlayer < ApplicationRecord
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

  def hit!
    self.hand << self.game.deck.deal
    self.save
  end

  def points
    max_points = hand.map(&:points).sum
    points = [ max_points ]
    hand_aces.each_with_index do |_, index|
      points << max_points - 10 * (index + 1)
    end
    points
  end

  def hand_aces
    hand.select { |card| card.rank == "A" }
  end
end
