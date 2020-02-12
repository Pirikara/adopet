class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :header_image, :text
    add_column :users, :introduce, :text
  end
end
