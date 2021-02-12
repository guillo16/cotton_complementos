class CreateInstalments < ActiveRecord::Migration[5.2]
  def change
    create_table :instalments do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.string :payment_status
      t.string :payment_id
      t.string :payment_status_detail
      t.string :processing_mode
      t.string :merchant_order_id
      t.string :back_url
      t.string :merchant_account_id
      t.string :authenticity_token

      t.timestamps
    end
  end
end
