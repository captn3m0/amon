class Gmail
  include HTTParty
  base_uri 'https://www.googleapis.com'

  def initialize(token)
    @options = {
      query: {key: token, includeSpamTrash: true},
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

  def fetch
    self.class.get(@suffix, @options)
  end
end