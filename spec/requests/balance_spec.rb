require 'rails_helper'
require 'faker'

RSpec.describe 'Balances', type: :request do
  describe 'GET /index' do
    before(:each) do
      @abel = User.create!(name: Faker::Name.unique.name,
                           email: Faker::Internet.email,
                           password: '1234567', password_confirmation: '1234567')
      @liability = Balance.create(name: 'Liability', icon: 'http://', author: @abel)
    end
    it 'should render the home page' do
      get '/'
      expect(response.status).to eq(302)
    end
    describe 'loged in users ability' do
      before(:each) do
        sign_in @abel
        get '/'
      end
      it 'should render the Balance Sheet page' do
        expect(response.status).to eq(200)
        expect(response.body).to include('Balance Sheet')
      end

      it 'should render the balance sheet catagories' do
        expect(response.body).to include('Liability')
      end
    end
  end
end
