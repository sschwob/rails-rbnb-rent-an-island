class RemoveIslandToOrder < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :island
    add_reference :orders, :booking, null: false, foreign_key: true
  end
end
