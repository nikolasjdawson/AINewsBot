class ApplicationMailer < ActionMailer::Base
  default from: @site.name + '<'+ @site.admin_email + '>'
  layout 'mailer'
end
