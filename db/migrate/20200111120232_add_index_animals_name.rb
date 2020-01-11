class AddIndexAnimalsName < ActiveRecord::Migration[5.2]
  def change
    add_index :animals, :category_id
    add_index :animals, :prefecture_id
  end
end
