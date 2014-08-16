Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_ID'], ENV['SLACK_SECRET'], scope: "read, identify"
  provider :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"],
    {
      :scope=>'https://www.googleapis.com/auth/drive,email,profile,https://mail.google.com/',
      :name =>'google',
      :prompt=>'consent',
      :access_type=>'offline',
      :include_granted_scopes=>true
    }
end