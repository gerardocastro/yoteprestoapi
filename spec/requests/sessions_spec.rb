require 'rails_helper'

describe "User sign in" do

  it 'logs in succesfully' do
    user = FactoryGirl.create(:user)
    xhr :post, "#{host_uri}api/v1/auth/sign_in", { username: user.username, password: user.password }

    expect(response).to be_success
  end

  it 'logs in failed' do
    xhr :post,  "#{host_uri}api/v1/auth/sign_in", { username: 'homero', password: 'test1234' }

    expect(response.status).to eq 401
  end
end