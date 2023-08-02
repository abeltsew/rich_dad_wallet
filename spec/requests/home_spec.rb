require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    it 'should display the home page' do
      get '/'
      expect(response.status).to eq(200)
      expect(response.body).to include('Rich Dad Wallet')
      expect(response.body).to include('Sign In')
    end
  end
end
