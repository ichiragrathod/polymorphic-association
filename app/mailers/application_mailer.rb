# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@crtech.com'
  layout 'mailer'
end
