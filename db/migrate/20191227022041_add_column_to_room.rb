class AddColumnToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :status_id, :integer
  end
end
