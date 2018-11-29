class SendNewsJob
  include SuckerPunch::Job

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      Subscriber.all.each do |sub|
        NewsMailer.send_news(sub.id).deliver_now
      end
    end
  end
end
