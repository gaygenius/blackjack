class Dealer < ApplicationRecord
  belongs_to :game

  serialize :hand, type: Array, coder: CardCoder
  after_initialize :initialize_dealer, if: :new_record?

  def initialize_dealer
    self.hand = [ self.game.deck.deal, self.game.deck.deal ]
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
