module PlayerModule
  extend ActiveSupport::Concern

  def hand_points
    points = 0
    aces = 0
    hand.each do |card|
      if card.face_card?
        points += 10
      elsif card.ace?
        aces += 1
        points += 11
      else
        points += card.points
      end
    end
    aces.times { points -= 10 if points > 21 }
    points
  end

  def hit!
    self.hand << self.game.deck.deal
    self.save
  end
end
