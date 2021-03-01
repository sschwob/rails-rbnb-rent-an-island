class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :country, :description, :latitude, :longitude, :price_per_day, :area, presence: true
end
