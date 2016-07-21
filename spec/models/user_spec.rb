require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:username) }
  
  it 'should have a unique #username' do
    FactoryGirl.create(:user)
    should validate_uniqueness_of(:username).case_insensitive
  end
end