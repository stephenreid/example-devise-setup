require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can create a new user' do
    FactoryGirl.create(:user)
  end

  it 'phone number is required' do
    u = FactoryGirl.build(:user)
    u.phone = nil
    expect(u).to_not be_valid
  end

  it 'removes -s from phone number' do
    u = FactoryGirl.build(:user)
    u.phone = '111-123-1234'
    u.save!
    expect(u.phone).to eq '1111231234'
  end
  
  it 'duplicate email not allowed' do
    original_user = FactoryGirl.create(:user)
    u = FactoryGirl.build(:user, email: original_user.email)
    expect(u).to_not be_valid
  end

end
