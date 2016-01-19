if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "84699587829-ecbqgsdbt5o9cesinp76lhqqrspv8j6v.apps.googleusercontent.com", "JDEvaSq4VC0nUFrmE2Y_W4eg"
end
