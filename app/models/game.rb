class Game < ApplicationRecord
  has_one :dealer
  has_one :deck, dependent: :destroy
  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players

  after_initialize :initialize_game, if: :new_record?

  def initialize_game
    self.title = Time.now.strftime("Game on %A, %B %d, %Y at %I:%M:%S %p")  # Set a default title
    self.players = []
    self.deck = Deck.new
  end
end
