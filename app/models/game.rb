class Game < ApplicationRecord
  has_one :dealer
  has_many :game_players
  has_many :players, through: :game_players

  def self.create_with_player(player:, **attributes)
    game = Game.new(attributes)  # Create a new game with given attributes
    game.title = Time.now.strftime("Game on %A, %B %d, %Y at %I:%M:%S %p")  # Set a default title
    game.players ||= []  # Initialize players if nil
    game.players << player
    game.save
  end
end
