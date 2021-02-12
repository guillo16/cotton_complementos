class AddFieldsToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :payment_status, :string
    add_column :payments, :payment_status_detail, :string
    add_column :payments, :processing_mode, :string
    add_column :payments, :merchant_order_id, :string
    add_column :payments, :back_url, :string
    add_column :payments, :merchant_account_id, :string
    add_column :payments, :authenticity_token, :string
  end
end
