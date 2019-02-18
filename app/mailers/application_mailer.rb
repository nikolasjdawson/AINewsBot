class ApplicationMailer < ActionMailer::Base
  @site = Site.last
  default from: @site.name + '<'+ @site.admin_email + '>'
  layout 'mailer'
end
