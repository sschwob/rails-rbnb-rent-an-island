class AddIslandToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :island, null: false, foreign_key: true
  end
end
