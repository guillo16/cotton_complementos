class Category < ApplicationRecord
  belongs_to :division
  has_many :products, dependent: :destroy
end
