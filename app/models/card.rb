class Card
  attr_accessor :suit, :rank

  SUITS = %w[Hearts Diamonds Clubs Spades]
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A]

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ace?
    rank == "A"
  end

  def face_card?
    %w[K Q J].include?(rank)
  end

  def points
    case rank
    when "A"
      11
    when "K", "Q", "J"
      10
    else
      rank.to_i
    end
  end
end
