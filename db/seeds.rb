# Create an admin user
user = User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

# Create some products
product1 = Product.create!(
  name: "Test Product 1",
  description: "Test description 1",
  price: 10.0
)

product2 = Product.create!(
  name: "Test Product 2",
  description: "Test description 2",
  price: 15.0
)

# Create some orders
Order.create!(user: user, product: product1, total: product1.price)
Order.create!(user: user, product: product2, total: product2.price)
