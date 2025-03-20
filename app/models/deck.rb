class Deck < ApplicationRecord
  belongs_to :game

  serialize :cards, type: Array, coder: CardCoder

  after_initialize :initialize_deck, if: :new_record?

  def initialize_deck
    self.cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        self.cards << Card.new(suit, rank)
      end
    end
    self.cards.shuffle!
  end

  def deal
    card = self.cards.pop
    self.save!
    card
  end
end
