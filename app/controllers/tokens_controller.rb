class TokensController < ApplicationController
  def new

  end

  def create
    info = JSON.parse params['info']
    raise "Invalid JSON" if info.nil?
    Token.create({
      :token=>params['oauth-token'],
      :provider=>params['provider'],
      :info=>info.to_json
    })
    flash[:notice] = "Token was added"
    redirect_to root_url
  end
end