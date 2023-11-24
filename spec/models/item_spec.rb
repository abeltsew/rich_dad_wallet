require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:each) do
    @abel = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: '1234567', password_confirmation: '1234567')
  end

  subject { Item.new(name: 'Car', amount: 450, author: @abel) }

  before { subject.save }

  describe 'Check validity of Items' do
    it 'should check validity of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity of amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity to be saved' do
      expect(subject).to be_valid
    end
  end
end
