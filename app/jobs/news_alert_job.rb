class NewsAlertJob
  include SuckerPunch::Job

  def perform(news_source_id)
    ActiveRecord::Base.connection_pool.with_connection do
      NewNewsAlertMailer.alert(news_source_id).deliver_now
    end
  end
end
