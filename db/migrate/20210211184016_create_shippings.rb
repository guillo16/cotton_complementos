class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :address
      t.string :phone
      t.references :order, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
