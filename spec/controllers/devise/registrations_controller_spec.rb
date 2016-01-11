require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  let!(:user){ 
    FactoryGirl.build(:user)
  }

  it 'creates a new user' do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    expect{ post :create, { user: { email: user.email, password: 'test1234', password_confirmation: 'test1234', phone: '123-456-7891' }}}.to change{ User.all.count}.by 1
  end
end
