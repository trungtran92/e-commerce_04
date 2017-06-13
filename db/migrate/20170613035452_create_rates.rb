class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.float :rate_point
      t.integer :product_id

      t.timestamps
    end
  end
end
