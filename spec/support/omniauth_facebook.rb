def valid_facebook_login_setup
  OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '123545',
      info: {
        name: 'Homero Simpson',
        email: 'homers@gmail.com',
        image: 'https://upload.wikimedia.org/wikipedia/en/0/02/Homer_Simpson_2006.png'
      }
    })
end

def invalid_facebook_login_setup
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end