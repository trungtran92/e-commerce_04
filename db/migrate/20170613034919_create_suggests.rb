class CreateSuggests < ActiveRecord::Migration[5.1]
  def change
    create_table :suggests do |t|
      t.integer :user_id
      t.string :product_name
      t.string :product_description
      t.float :product_price
      t.integer :status

      t.timestamps
    end
  end
end
