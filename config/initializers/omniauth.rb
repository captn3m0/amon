Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_ID'], ENV['SLACK_SECRET'], scope: "read, identify"
end