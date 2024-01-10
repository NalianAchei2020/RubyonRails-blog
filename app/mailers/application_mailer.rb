# frozen_string_literal: true

# The `ApplicationMailer` class is the base mailer for the application.
# It sets the default sender address and specifies the layout for email templates.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
