class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :header_image, :text
  end
end
