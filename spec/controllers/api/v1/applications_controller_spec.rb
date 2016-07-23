require 'rails_helper'

RSpec.describe Api::V1::ApplicationsController, type: :controller do
  describe 'with a logged in user' do
    login_user

    before do
      @application = FactoryGirl.build(:complete_application, user: @user)
      @application.save
    end

    describe 'GET index' do
      before do
        xhr :get, :index
        @response = response 
        @data = JSON.parse(@response.body)
      end

      it {expect(@response.status).to eq 200}
      it {expect(@data.size).to eql(1)}
      it {expect(@data[0]['id']).to eql(@application.id)}
      it {expect(@data[0]).to include('expenses_attributes')}
      it {expect(@data[0]).to include('references_attributes')}
    end

    describe 'GET show' do
      before do
        xhr :get, :show, {id: @application.id}
        @response = response 
        @data = JSON.parse(@response.body)
      end

      it {expect(@response.status).to eq 200}
      it {expect(@data['id']).to eql(@application.id)}
      it {expect(@data).to include('expenses_attributes')}
      it {expect(@data['expenses_attributes'].size).to eql(1)}
      it {expect(@data).to include('references_attributes')}
      it {expect(@data['references_attributes'].size).to eql(3)}
    end

    describe 'POST create' do
      before do
        @new_application = FactoryGirl.build(:complete_application)
        expenses_attributes = {expenses_attributes: @new_application.expenses.map(&:attributes)}
        references_attributes = {references_attributes: @new_application.references.map(&:attributes)}
        attributes = @new_application.attributes.merge(expenses_attributes).merge(references_attributes)
        xhr :post, :create, application: attributes
        @response = response 
        @data = JSON.parse(@response.body)
      end

      it {expect(@response.status).to eq 200}
      it {expect(Application.count).to eql(2)}
      it {expect(Expense.count).to eql(2)}
      it {expect(Reference.count).to eql(6)}
      it {expect(@data['id']).to eql(Application.last.id)}
    end

    describe 'PUT update' do
      describe 'updated successfully' do
        before do
          expense = @application.expenses[0]
          reference = @application.references[0]
          xhr :put, :update, {id: @application.id, application: {loan_title: 'new_loan', 
              expenses_attributes: {id: expense.id, amount: 200},
              references_attributes: {id: reference.id, first_name: 'bart'}}}
          @application.reload
          @response = response
          @data = JSON.parse(@response.body)
        end

        it {expect(@response.status).to eq 200}
        it {expect(@application.loan_title).to eq('new_loan')}
        it {expect(@application.expenses[0].amount).to eq(200)}
        it {expect(@application.references[0].first_name).to eq('bart')}
      end

      describe 'updated failure' do
        before do
          expense = @application.expenses[0]
          reference = @application.references[0]
          xhr :put, :update, {id: @application.id, application: {loan_title: '', 
              expenses_attributes: {id: expense.id, amount: nil},
              references_attributes: {id: reference.id, first_name: ''}}}
          @response = response
          @data = JSON.parse(@response.body)
        end

        it {expect(@response.status).to eq 422}

        it {expect(@data['loan_title']).to include("can't be blank")}
        it {expect(@data['expenses.amount']).to include("can't be blank")}
        it {expect(@data['references.first_name']).to include("can't be blank")}
      end
    end
  end

  describe 'with no logged in user' do
    before do
      @application = FactoryGirl.build(:complete_application)
      @application.save
    end

    describe 'GET index' do
      it 'expect to return unauthorized' do
        xhr :get, :index
        expect(response.status).to eq 401
      end
    end

    describe 'GET show' do
      it 'expect to return unauthorized' do
        xhr :get, :show, {id: @application.id}
        expect(response.status).to eq 401
      end
    end

    describe 'POST create' do
      it 'expect to return unauthorized' do
        xhr :post, :create, {id: @application.id}
        expect(response.status).to eq 401
      end
    end

    describe 'PUT update' do
      it 'expect to return unauthorized' do
        xhr :put, :update, {id: @application.id}
        expect(response.status).to eq 401
      end
    end
  end
end
