require 'gmail'

class GoogleController < ApplicationController

  before_action :set_token

  def index
    render json: @gmail.threads.fetch.to_json
  end

  private

  def set_token
    @token = Token.find(params['id'])
    @token.info = JSON.parse(@token.info)
    @gmail = Gmail.new @token.token
  end

end