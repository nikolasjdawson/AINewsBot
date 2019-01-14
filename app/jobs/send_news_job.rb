class SendNewsJob
  include SuckerPunch::Job

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      day_of_week = Date.today.wday
      subscribers = DayOfWeek.find(day_of_week).subscribers
      subscribers.all.each do |sub|
        NewsMailer.send_news(sub.id).deliver_now
      end
    end
  end
end
