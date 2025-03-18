class Deck
  include ActiveModel::Model

  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end
