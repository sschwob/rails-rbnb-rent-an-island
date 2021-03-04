class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  monetize :price_per_day_cents

  validates :name, presence: true, uniqueness: true
  validates :country, :description, :latitude, :longitude, :price_per_day, :area, presence: true
end
