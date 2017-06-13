class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :status
      t.string :address_recive
      t.string :phone_recive

      t.timestamps
    end
  end
end
