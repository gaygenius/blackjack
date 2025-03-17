class CreateDealers < ActiveRecord::Migration[8.0]
  def change
    create_table :dealers do |t|
      t.timestamps
    end
  end
end
