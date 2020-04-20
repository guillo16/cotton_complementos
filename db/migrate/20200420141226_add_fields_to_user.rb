class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :postal, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
