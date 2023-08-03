require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'GET /index' do
    before(:each) do
      @abel = User.create!(name: Faker::Name.unique.name,
                           email: Faker::Internet.email,
                           password: '1234567', password_confirmation: '1234567')
      @liability = Balance.create(name: 'Liability', icon: 'http://', author: @abel)
      @item = Item.create(name: 'Item', amount: 254)
    end

    describe 'render new page' do
      before(:each) do
        sign_in @abel
        get new_balance_item_path(@liability.id)
      end

      it 'should render new page' do
        expect(response.status).to eq(200)
        expect(response.body).to include('NEW ITEM')
      end
    end
  end
end
