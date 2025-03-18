class CreateDecks < ActiveRecord::Migration[8.0]
  def change
    create_table :decks do |t|
      t.text :cards, null: false
      t.timestamps
    end
  end
end
