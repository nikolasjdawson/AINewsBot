class NewsMailer < ApplicationMailer
  def send_news(subscriber_id)
    @subscriber = Subscriber.find(subscriber_id)
    @categories = Category.includes(:items).where(items: { created_at: 1.day.ago..DateTime.now })
    mail to: @subscriber.email, subject: "Hi " + @subscriber.first_name + ", here's the latest news from " + @site.name
  end
end
