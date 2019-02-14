class ApplicationMailer < ActionMailer::Base
  if @site
    default from: @site.name + '<'+ @site.admin_email + '>'
  end
  layout 'mailer'
end
