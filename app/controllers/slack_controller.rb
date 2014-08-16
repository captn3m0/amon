require 'slack'

class SlackController < ApplicationController

  before_action :set_token

  def index
    @channels = Slack.channels_list['channels']
    @groups = Slack.groups_list['groups']
  end

  def channel
    @history = Slack.channels_history({
      :channel=>params['channel'],
      :count=>1000
    })['messages']
    @name = params['name']
    render 'history'
  end

  def group
    @history = Slack.groups_history({
      :channel=>params['group'],
      :count=>1000
    })['messages']
    @name = params['name']
    render 'history'
  end

  def users
    @users = Slack.users_list['members']
    if(params['format'] == 'json')
      render json: @users
    else
      render 'users'
    end
  end

  private

  def set_token
    @token = Token.find(params['id'])
    @token.info = JSON.parse(@token.info)
    Slack.configure do |config|
      config.token = @token.token
    end
  end

end