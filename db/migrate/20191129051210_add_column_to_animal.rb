class AddColumnToAnimal < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :gender_id, :integer, null: false
  end
end
