class Reference < ActiveRecord::Base
  # assosiations
  belongs_to :application

  # validations
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :f_last_name, presence: true
  validates :s_last_name, presence: true
  validates :mobile, presence: true
  validates :relation_type, presence: true
end
