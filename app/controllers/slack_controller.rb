require 'slack'

class SlackController < ApplicationController

  before_action :set_token

  def index
    @channels = Slack.channels_list['channels']
    @groups = Slack.groups_list['groups']
  end

  def channel
  end

  def group
  end
  
  private

  def set_token
    @token = Token.find(params['id'])
    Slack.configure do |config|
      config.token = @token.token
    end
  end

end