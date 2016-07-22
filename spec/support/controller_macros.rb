module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryGirl.create(:user)
      auth_headers = user.create_new_auth_token
      request.headers.merge!(auth_headers)
    end
  end
end