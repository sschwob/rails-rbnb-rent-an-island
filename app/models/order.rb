class Order < ApplicationRecord
  belongs_to :user
  belongs_to :island
  monetize :amount_cents
end
