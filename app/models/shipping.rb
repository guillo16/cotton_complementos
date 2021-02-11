class Shipping < ApplicationRecord
  belongs_to :order

  validates :address, presence: true
  validates :phone, presence: true
  validates :amount, presence: true


end
