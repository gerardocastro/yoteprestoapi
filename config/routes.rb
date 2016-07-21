Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' }  do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          omniauth_callbacks: 'overrides/omniauth_callbacks',
          sessions:           'overrides/sessions'
        }
    end
  end
end
