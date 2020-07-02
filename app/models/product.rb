class Product < ApplicationRecord
  belongs_to :category
  has_many :variants, dependent: :destroy
  validates :title, presence: true
  has_many :line_items, dependent: :destroy
  monetize :price_cents
  validates :price, presence: true
  has_many_attached :photos
  has_many :charges
  validates :photos, presence: true
  validates :description, presence: true
  paginates_per 4

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
