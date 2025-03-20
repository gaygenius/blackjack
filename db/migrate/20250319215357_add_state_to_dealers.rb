class AddStateToDealers < ActiveRecord::Migration[8.0]
  def change
    add_reference :dealers, :game, null: false
    add_column :dealers, :hand, :text, default: [].to_json
    add_column :dealers, :bet, :integer, default: 0
  end
end
