class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, 
          :registerable, :trackable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  # validations
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
