class Product < ApplicationRecord
  has_many :orders


  def self.search(search_term)

    # For the local
    # Product.where("name LIKE ?", "%#{search_term}%")

    # For the production
    Product.where("name ilike ?", "%#{search_term}%")
  end
end
