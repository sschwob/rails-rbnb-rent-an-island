class AddColumnOwnerAnswerNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :owner_answer, :boolean, default: false
  end
end
