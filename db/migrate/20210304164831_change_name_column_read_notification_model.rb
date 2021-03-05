class ChangeNameColumnReadNotificationModel < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :read, :to_read
  end
end
