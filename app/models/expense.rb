class Expense < ActiveRecord::Base
  # assosiations
  belongs_to :application

  # validations
  validates :expense_type, presence: true
  validates :amount, presence: true
end
