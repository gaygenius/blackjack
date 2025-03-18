class Deck < ApplicationRecord
  serialize :cards, type: Array, coder: JSON

  after_initialize :initialize_deck, if: :new_record?

  def initialize_deck
    self.cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        puts "Initializing card with suit: #{suit}, rank: #{rank}"  # Debug statement
        self.cards << Card.new(suit, rank)
      end
    end
    self.cards.shuffle!
  end

  def deal
    self.cards.pop
  end
end
