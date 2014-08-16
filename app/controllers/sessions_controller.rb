class SessionsController < ApplicationController
  def create
    begin
      Token.create_from_omniauth(auth_hash)
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to '/', flash: {notice: "Token already exists"}
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end