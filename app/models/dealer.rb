class Dealer < ApplicationRecord
  include PlayerModule

  belongs_to :game

  serialize :hand, type: Array, coder: CardCoder
  after_initialize :initialize_dealer, if: :new_record?

  def initialize_dealer
    self.hand = [ self.game.deck.deal, self.game.deck.deal ]
  end
end
