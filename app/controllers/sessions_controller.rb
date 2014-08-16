class SessionsController < ApplicationController
  def create
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

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end