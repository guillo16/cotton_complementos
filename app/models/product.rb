class Product < ApplicationRecord
  belongs_to :category
  has_many :variants, dependent: :destroy
  validates :title, presence: true
  has_many :line_items
  monetize :price_cents
  validates :price, presence: true
  has_many_attached :photos

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
