class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :fullname
      t.string :email
      t.string :address
      t.string :avatar
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.integer :status

      t.timestamps
    end
  end
end
