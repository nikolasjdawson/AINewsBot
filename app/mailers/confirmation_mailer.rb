class ConfirmationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.confirm.subject
  #
  def confirm(subscriber_id)
    @subscriber = Subscriber.find(subscriber_id)

    mail to: @subscriber.email, subject: "Please confirmation your subscription to AI NewsBot"
  end
end
