class AddColumnToNotifications < ActiveRecord::Migration[5.0]
  def change
  	add_column :notifications, :post_id, :integer
  end
end
