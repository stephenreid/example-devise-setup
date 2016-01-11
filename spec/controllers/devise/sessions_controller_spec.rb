require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :controller do
  let!(:user){ 
    FactoryGirl.create(:user)
  }

  it 'creates a new user session' do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    expect( post :create, { user: { email: user.email, password: 'test1234' }}).to redirect_to root_path
  end

  it 'fails to login' do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    expect( post :create, { user: { email: user.email, password: 'wrongpassword' }}).to_not redirect_to root_path
  end
end
