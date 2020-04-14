class Product < ApplicationRecord
  belongs_to :category
  has_many :variants

  validates :title, presence: true
  validates :photo, presence: true
end
