class AdWidthToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :width, :string
  end
end
