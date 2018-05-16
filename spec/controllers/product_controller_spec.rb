require 'rails_helper'

describe ProductsController, focus: true, type: :controller do
  before do
    @user = FactoryBot.create(:user, :admin)
    sign_in @user
    @product = FactoryBot.create(:product, name: "Test Product", description: "Test product", price: 6.33)
  end

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


end
