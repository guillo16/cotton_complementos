class Product < ApplicationRecord
  belongs_to :category
  has_many :variants

  validates :title, presence: true
  validates :photo, presence: true

  has_many :line_items

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
