class Google
  include HTTParty
  base_uri "https://accounts.google.com"

  # Token is an instance of Token
  def initialize(token)
    @token = token
    if Time.now.to_i > @token.get_info['token_expiry']
      self.refresh
    end
  end

  def refresh
    refresh_token = @token.get_info['refresh_token']
    response = self.class.post('/o/oauth2/token', {
      :body=>{
        :client_id=>ENV['GOOGLE_ID'],
        :client_secret=>ENV['GOOGLE_SECRET'],
        :refresh_token=>refresh_token,
        :grant_type=>"refresh_token"
      }
    }).parsed_response
    @token.update_attribute 'token', response["access_token"]
    @token.set_info 'token_expiry', Time.now.to_i+response["expires_in"]
  end
end