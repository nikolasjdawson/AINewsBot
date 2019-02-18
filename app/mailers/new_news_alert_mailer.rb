class NewNewsAlertMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_news_alert_mailer.alert.subject
  #
  def alert(news_source_id)
    @news_source = NewsSource.find(news_source_id)
    @site = Site.last
    mail to: @site.admin_email, subject: "Some has submitted a news source."

  end
end
