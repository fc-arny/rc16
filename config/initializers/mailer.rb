# frozen_string_literal: true
# Required for links generation in emails
Rails.application.config.action_mailer.default_url_options = {
  host: ENV['DOMAIN']
}.compact

if Rails.env.development?
  Rails.application.config.action_mailer.default_url_options.reverse_merge!(host: 'localhost:3000')
end
Rails.application.config.action_mailer.perform_deliveries = true unless Rails.env.test?
Rails.application.config.action_mailer.raise_delivery_errors = true
