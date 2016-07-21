class Overrides::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  protected

    def assign_provider_attrs(user, auth_hash)
      user.assign_attributes({
        username: auth_hash['info']['name'],
        image:    auth_hash['info']['image'],
        email:    auth_hash['info']['email']
      })
    end
end
