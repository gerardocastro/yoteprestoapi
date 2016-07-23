class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, 
          :registerable, :trackable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  # assosiations
  has_many :applications

  # constants
  MANDATORY_ATTRIBUTES = %w(username first_name second_name f_last_name s_last_name sex curp rfc mobile phone)

  # validations
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :mandatory_fields_not_blank, on: :update
  validates :sex, length: { maximum: 10 }, inclusion: { in: %w(Male Female) }, allow_nil: true
  validates :curp, length: { maximum: 18 }
  validates :rfc, length: { maximum: 13 }


  # callbacks
  before_update :validate_completed

  private
    def validate_completed
      any_blank = MANDATORY_ATTRIBUTES.any? {|field| self.send(field).blank? }
      self.finished = true unless any_blank
    end

    def mandatory_fields_not_blank
      MANDATORY_ATTRIBUTES.each do |attribute|
        errors.add(attribute, "can't be blank") if self[attribute] == ''
      end
    end

end
