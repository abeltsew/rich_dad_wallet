require 'rails_helper'

RSpec.describe Balance, type: :model do
  before(:each) do
    @abel = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: '1234567', password_confirmation: '1234567')
  end

  subject { Balance.new(name: 'Assset', icon: 'some icon', author: @abel) }

  before { subject.save }

  describe 'Check validity of Balance' do
    it 'should check validity of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity of icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity to be saved' do
      expect(subject).to be_valid
    end
  end
end
