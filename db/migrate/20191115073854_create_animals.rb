class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name,  null: false, index: true
      t.string :state, null: false
      t.text :description, null: false
      t.references :category,  null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true
      t.references :giver, null: false, foreign_key: { to_table: :users }
      t.references :taker, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
