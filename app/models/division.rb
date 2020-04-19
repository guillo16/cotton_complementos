class Division < ApplicationRecord
  has_many :categories, dependent: :destroy
end
