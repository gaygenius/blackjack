class AddGameIdToDecks < ActiveRecord::Migration[8.0]
  def change
    add_reference :decks, :game, null: false
  end
end
