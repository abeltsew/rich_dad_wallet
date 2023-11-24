require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    it 'should display the home page by redirecting' do
      get '/home'
      expect(response.status).to eq(200)
      expect(response.body).to include('Rich Dad Wallet')
      expect(response.body).to include('LOG IN')
    end
  end
end
