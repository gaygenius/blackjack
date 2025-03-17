class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.text :title, null: false

      t.timestamps
    end
  end
end
