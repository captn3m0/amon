require 'slack'

class SlackController < ApplicationController
  def show
    @token = Token.find(params['id'])
    Slack.configure do |config|
      config.token = @token.token
    end
    render json: Slack.channels_list
  end
end