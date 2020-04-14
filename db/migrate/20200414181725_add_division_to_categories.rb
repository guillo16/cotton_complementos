class AddDivisionToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :division, foreign_key: true
  end
end
