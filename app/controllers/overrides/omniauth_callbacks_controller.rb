class Overrides::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  protected

    def assign_provider_attrs(user, auth_hash)
      user.username = auth_hash['info']['name'] if user.username.blank?
      user.email = auth_hash['info']['email'] if user.email.blank?
      user.image = auth_hash['info']['image']
    end
end
