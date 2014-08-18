require 'email_reply_parser'

module ApplicationHelper

  def base64_decode(text)
    text.tr('-_','+/').unpack('m')[0]
  end

  def parse_email_body(body)
    EmailReplyParser.parse_reply(body)
  end

end
