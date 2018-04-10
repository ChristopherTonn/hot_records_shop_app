class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :product_price
      t.string :music_label
      t.string :release_date

      t.timestamps
    end
  end
end
