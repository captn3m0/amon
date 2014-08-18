class Token < ActiveRecord::Base
  validates_presence_of :token, :provider

  def self.create_from_omniauth(auth_hash)
    case auth_hash.provider

    when 'slack'
      Token.create({
        :token=>auth_hash.credentials.token,
        :provider=>auth_hash.provider,
        :info=>auth_hash.info.to_json
      })
    when 'google'
      auth_hash.info['refresh_token'] = auth_hash.credentials.refresh_token
      auth_hash.info['token_expiry'] = auth_hash.credentials.expires_at
      Token.create({
        :token=>auth_hash.credentials.token,
        :provider=>auth_hash.provider,
        :info=>auth_hash.info.to_json
      })
    else
      raise "Invalid provider"
    end

  end

  def get_info
    JSON.parse self.info
  end

  def set_info(key, value)
    info = get_info
    info[key] = value
    self.update_attribute 'info', info.to_json
  end
end