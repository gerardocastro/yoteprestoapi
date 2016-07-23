require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should belong_to(:application) }

  it { is_expected.to validate_presence_of(:expense_type) }
  it { is_expected.to validate_presence_of(:amount) }
end
