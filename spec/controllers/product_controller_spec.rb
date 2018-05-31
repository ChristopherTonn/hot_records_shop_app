require 'rails_helper'

describe ProductsController, focus: true, type: :controller do
  before do
    @user = FactoryBot.create(:admin)
    sign_in @user
    @product = FactoryBot.create(:product, name: "Test Product", description: "Test product", price: 6.33)
  end

  #---GET----
  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #show' do
    it 'renders show template' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
  end

  context 'GET #edit' do
    it "renders edit template" do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end


  #---POST----
  context "POST #create" do
    it "if attr are correct shows product page" do
      @product = Product.create!(name: "Hot Records", description: "Nice Bla bla.", image_url: "hotrecods.jpg", price: "10")
      post :create, params: { product: { name: @product.name, description: @product.description, image_url: @product.image_url, price: @product.price} }
      expect(response).to redirect_to(:action => :show, :id => assigns(:product).id)
    end
  end

  context "POST #update" do
    it "updates product attributes" do
      @update = { name: "Not A Hot Record"}
      post :update, params: {id: @product.id, product: @update }
      @product.reload
      expect(@product.name).to eq "Not A Hot Record"
    end
  end

  #---POST----
  context "DELETE #destroy" do
    it "destroy product and go back to products_path" do
      delete :destroy, params: { id: @product.id}
      expect(response).to redirect_to products_path
    end
  end
  end




end
