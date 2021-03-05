class ChangeDefaultValueStateBookingModel < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :state, :string, default: "Waiting"
  end
end
