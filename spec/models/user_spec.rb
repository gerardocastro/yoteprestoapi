require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:applications) }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_inclusion_of(:sex).in_array(%w(Male Female)) }
  it { is_expected.to validate_length_of(:curp).is_at_most(18) }
  it { is_expected.to validate_length_of(:rfc).is_at_most(13) }

  
  it 'expect to have a unique #username' do
    FactoryGirl.create(:user)
    should validate_uniqueness_of(:username).case_insensitive
  end

  it 'expect to be finished with all filds filled after update' do
    @user = FactoryGirl.create(:user)
    @user.update({username: 'bart'})
    @user.reload
    expect(@user.finished).to be true
  end

  it 'expect to validate not be blank on update' do
    @user = FactoryGirl.create(:user)
    User::MANDATORY_ATTRIBUTES.each do |attribute|
      @user.reload
      @user[attribute] = ''
      expect(@user).not_to be_valid
      expect(@user.errors.messages[attribute.to_sym]).to include("can't be blank")
    end
  end
end