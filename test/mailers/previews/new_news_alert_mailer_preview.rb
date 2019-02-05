# Preview all emails at http://localhost:3000/rails/mailers/new_news_alert_mailer
class NewNewsAlertMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_news_alert_mailer/alert
  def alert
    NewNewsAlertMailer.alert
  end

end
