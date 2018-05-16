require 'rails_helper'

describe Product do

  before do
    @product = Product.create!(description: "Nice Bla bla Sound. Mega bla bla Destrotion. Superb",name: "HOT REC. EP")
    @user = User.create!(first_name: "Max",email: "ma@gmail.com", last_name: "Muster",password: "123123")
    @product.comments.create!(rating: 1, user: @user, body: "Awful Destrotion!")
    @product.comments.create!(rating: 3, user: @user, body: "Average Sound!")
    @product.comments.create!(rating: 5, user: @user, body: "Beautiful EP! Love it!")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq(3)
  end

  it "is not valid" do
    expect(Product.new(description: "Nice flow.")).not_to be_valid
  end

end
