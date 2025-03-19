class AddGameIdToDecks < ActiveRecord::Migration[8.0]
  def change
    add_reference :decks, :game, null: false, foreign_key: true
  end
end
