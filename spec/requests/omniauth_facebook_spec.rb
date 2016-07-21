require 'rails_helper'

describe "GET 'api/v1/auth/facebook/callback'" do
  describe 'with invalid credentials' do
    before do
      invalid_facebook_login_setup
      get_via_redirect "#{host_uri}api/v1/auth/facebook"
    end

    it { expect(response.status).to eql(405) }

    it "expect to not create a user" do
      expect(User.count).to eql(0)
    end
  end

  describe 'with valid credentials' do
    describe 'with a new user' do
      before do
        valid_facebook_login_setup
        get_via_redirect "#{host_uri}api/v1/auth/facebook"

        @resource = assigns(:resource)
      end

      it { expect(response).to be_success }

      it 'expect to create a user' do
        expect(@resource).not_to be_nil
        expect(@resource.class).to be(User)
        expect(User.count).to eql(1)
      end

      it 'expect to login the user' do
        expect(@resource.sign_in_count).to eql(1)
      end
    end
    
    describe 'with an existing user' do
      before do
        @user = FactoryGirl.create(:user, {provider: 'facebook', uid: '123545'})
        valid_facebook_login_setup
        get_via_redirect "#{host_uri}api/v1/auth/facebook"

        @resource = assigns(:resource)
      end

      it { expect(response).to be_success }

      it "expect to not create a user" do
        expect(@resource).not_to be_nil
        expect(@resource.class).to be(User)
        expect(User.count).to eql(1)
      end

      it 'expect to login the user' do
        expect(@resource.sign_in_count).to eql(1)
      end
    end
  end
end

