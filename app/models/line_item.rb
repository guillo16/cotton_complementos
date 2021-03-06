class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :variant

  def total_price
    product.price.to_i * quantity.to_i
  end
end
