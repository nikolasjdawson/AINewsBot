class SendNewsJob
  include SuckerPunch::Job

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      Time.zone = "Sydney"
      day_of_week = Time.current.wday
      subscribers = DayOfWeek.find(day_of_week).subscribers.active
      subscribers.all.each do |sub|
        NewsMailer.send_news(sub.id).deliver_now
      end
    end
  end
end
