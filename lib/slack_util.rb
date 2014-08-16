require 'slack'
class SlackUtil
  def initialize(token)
    
  end

  def get_channels()
    Slack.channels_list
  end
end