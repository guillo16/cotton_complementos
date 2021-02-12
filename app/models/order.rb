class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_one :payment
  has_one :shipping

  monetize :amount_cents
  monetize :total_cents
end
