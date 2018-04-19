class Product < ApplicationRecord

  product = Product.create(
    name: "Test Product",
    description: "Lorem Ipsum",
    image_url: "https://oye-records.com/media/__sized__/releases/petar-dundov-marc-romboy-caper-tran-ep-crop-c0-5__0-5-600x600-70.jpg"
  )

  has_many :orders


  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end
end
