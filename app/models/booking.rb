class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  has_one :order
  has_one :notification, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  def total_price
    (end_date - start_date).to_i * island.price_per_day
  end
end

