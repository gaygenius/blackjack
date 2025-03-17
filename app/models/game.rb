class Game < ApplicationRecord
  has_one :dealer
  has_many :game_players
  has_many :players, through: :game_players

  def self.create_with_player(player:, **attributes)
    game = Game.new(attributes)  # Create a new game with given attributes
    game.title = Time.now.strftime("Game on %A, %B %d, %Y at %I:%M:%S %p")  # Set a default title
    game.players ||= []  # Initialize players if nil
    game.players << player
    if game.save
      game
    else
      # Handle the error appropriately, e.g., raise an error or log it
      raise ActiveRecord::RecordInvalid.new(game)
    end
  end
end
