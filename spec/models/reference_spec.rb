require 'rails_helper'

RSpec.describe Reference, type: :model do
  it { should belong_to(:application) }
  
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:second_name) }
  it { is_expected.to validate_presence_of(:f_last_name) }
  it { is_expected.to validate_presence_of(:s_last_name) }
  it { is_expected.to validate_presence_of(:mobile) }
  it { is_expected.to validate_presence_of(:relation_type) }
end
