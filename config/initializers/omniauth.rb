Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_app_secret, callback_url: "https://yoteprestoapi.herokuapp.com/omniauth/facebook/callback"
end