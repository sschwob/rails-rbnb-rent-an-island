class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :country, :description, :latitude, :longitude, :price_per_day, :area, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_country_or_price_per_day,
    against: [:name, :country, :price_per_day],
    using: {
      tsearch: { prefix: true }
  }
end
