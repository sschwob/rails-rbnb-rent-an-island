class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  has_one :notification, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
end
