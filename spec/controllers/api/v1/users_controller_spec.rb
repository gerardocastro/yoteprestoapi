require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'with a logged in user' do
    login_user

    describe 'GET show' do
      before do
        xhr :get, :show
        @user = User.first
        @data = JSON.parse(response.body)
      end

      it "expect to return logged in user" do
        expect(@user.email).to eq(@data['email'])
        expect(@user.username).to eq(@data['username'])
      end

      it {expect(@response.status).to eq 200}
      it {expect(@data).not_to include('id')}
      it {expect(@data).not_to include('created_at')}
      it {expect(@data).not_to include('updated_at')}
    end

    describe 'PUT update' do
      describe 'updated successfully' do
        before do
          xhr :put, :update, {username: 'bart'}
          @user.reload
          @response = response
          @data = JSON.parse(@response.body)
        end

        it {expect(@response.status).to eq 200}

        it {expect(@user.username).to eq('bart')}

        it 'expect to return the current user' do
          expect(@user.email).to eq(@data['email'])
          expect(@user.username).to eq(@data['username'])
        end
      end

      describe 'updated failure' do
        before do
          xhr :put, :update, {rfc: '012345678901234567887654'}
          @response = response
          @data = JSON.parse(@response.body)
        end

        it {expect(@response.status).to eq 422}

        it {expect(@data).to include('rfc')}

        it {expect(@data['rfc']).to include('is too long (maximum is 13 characters)')}
      end
    end
  end

  describe 'with no logged in user' do
    describe 'GET show' do
      it 'expect to return unauthorized' do
        xhr :get, :show
        expect(response.status).to eq 401
      end
    end

    describe 'PUT update' do
      it 'expect to return unauthorized' do
        xhr :put, :update, {username: 'bart'}
        expect(response.status).to eq 401
      end
    end
  end
end