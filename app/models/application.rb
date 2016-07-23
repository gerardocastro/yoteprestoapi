class Application < ActiveRecord::Base
  include ActiveModel::Serialization
  
  # assosiations
  belongs_to :user
  has_many :expenses
  has_many :references

  # validations
  validate  :require_one_expense
  validate  :require_three_references
  validates :loan_title, presence: true
  validates :loan_detail, presence: true
  validates :loan_destination, presence: true
  validates :funding_days, presence: true
  validates :has_credit_card, presence: true, allow_blank: true
  validates :has_insurance, presence: true, allow_blank: true
  validates :has_car, presence: true, allow_blank: true
  validates :other_income, presence: true
  validates :education, presence: true
  validates :pay_job, presence: true
  validates :year_job, presence: true
  validates :company_job, presence: true

  # nested attributes
  accepts_nested_attributes_for :expenses, update_only: true, allow_destroy: true
  accepts_nested_attributes_for :references, update_only: true

  private
    def require_one_expense
      errors.add(:base, "You must provide at least one expense") if expenses.size < 1
    end

    def require_three_references
      errors.add(:base, "You must provide three references") if references.size != 3
    end
end
