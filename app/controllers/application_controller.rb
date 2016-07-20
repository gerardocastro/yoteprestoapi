class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  wrap_parameters false
  respond_to :json

  protected
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
