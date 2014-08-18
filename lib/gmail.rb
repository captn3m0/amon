class Gmail
  include HTTParty
  base_uri ENV['GMAIL_BASE'] || "https://www.googleapis.com"

  def initialize(token)
    @options = {
      headers: { "Authorization" => "Bearer #{token}" }
    }
  end

  def add_param(name, value)
    @options['query'][name] = value
  end

  def query(q)
    @suffix = "/threads"
    self.add_param 'q', q
    self
  end

  def threads
    @suffix = '/gmail/v1/users/me/threads'
    self
  end

  def messages
    @suffix = '/gmail/v1/users/me/messages'
    self
  end

  def thread(id)
    @suffix = '/gmail/v1/users/me/threads/'+id
    self
  end

  def message(id)
    @suffix = '/gmail/v1/users/me/messages/'+id
    self
  end

  def fetch
    self.class.get(@suffix, @options).parsed_response
  end
end