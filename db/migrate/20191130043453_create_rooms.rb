class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :animal, foreign_key: true
      t.references :host, foreign_key: {to_table: :users}, null: false
      t.references :client, foreign_key: {to_table: :users}, null: false
      t.integer :status
      t.timestamps
    end
  end
end
