class AddViewedToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :viewed, :integer
  end
end
