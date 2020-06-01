class AddSaleToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale, :integer
  end
end
