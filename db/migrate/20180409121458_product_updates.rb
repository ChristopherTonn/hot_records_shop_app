class ProductUpdates < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :floats
    add_column :products, :music_label, :string
    add_column :products, :release_date, :string
  end
end
