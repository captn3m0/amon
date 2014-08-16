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
    else
      rails "Invalid provider"
    end

  end
end