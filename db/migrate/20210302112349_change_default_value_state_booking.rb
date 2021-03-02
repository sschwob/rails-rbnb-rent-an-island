class ChangeDefaultValueStateBooking < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :state, :string, default: "waiting"
  end
end
