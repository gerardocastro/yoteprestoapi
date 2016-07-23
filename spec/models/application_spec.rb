require 'rails_helper'

RSpec.describe Application, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:expenses) }
  it { should have_many(:references) }

  it { is_expected.to validate_presence_of(:loan_title) }
  it { is_expected.to validate_presence_of(:loan_detail) }
  it { is_expected.to validate_presence_of(:loan_destination) }
  it { is_expected.to validate_presence_of(:funding_days) }
  it { is_expected.to validate_presence_of(:other_income) }
  it { is_expected.to validate_presence_of(:education) }
  it { is_expected.to validate_presence_of(:pay_job) }
  it { is_expected.to validate_presence_of(:year_job) }
  it { is_expected.to validate_presence_of(:company_job) }

  describe 'expect to validate application has' do
    it 'at least one expense' do
      application = FactoryGirl.build(:application)
      expect(application).not_to be_valid
      expect(application.errors.messages[:base]).to include("You must provide at least one expense")
    end

    it 'three references' do
      application = FactoryGirl.build(:application)
      expect(application).not_to be_valid
      expect(application.errors.messages[:base]).to include("You must provide three references")
    end
  end
end
