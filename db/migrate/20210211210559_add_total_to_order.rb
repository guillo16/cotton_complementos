class AddTotalToOrder < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :total
  end
end
