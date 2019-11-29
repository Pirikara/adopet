class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name,  null: false, index: true
      t.text :description, null: false
      t.integer :prefecture_id, null: false
      t.integer :category_id,  null: false
      t.references :giver, null: false, foreign_key: { to_table: :users }
      t.references :taker, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end