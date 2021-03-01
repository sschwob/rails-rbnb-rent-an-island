class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :country, :description, :latitude, :longitude, :price_per_day, :area, presence: true
end
