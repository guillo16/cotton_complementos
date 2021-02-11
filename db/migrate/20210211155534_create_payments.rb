class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.string :title
      t.integer :amount

      t.timestamps
    end
  end
end
