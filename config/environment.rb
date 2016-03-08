# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


config.action_mailer.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app48004472@heroku.com'],
  :password       => ENV['4iuwdetq9443'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}