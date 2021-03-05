class AddPriceToIsland < ActiveRecord::Migration[6.1]
  def change
    add_monetize :islands, :price_per_day, currency: { present: false }
  end
end
