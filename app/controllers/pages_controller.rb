class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def about
  end

  def contact
  end

  def ainews
    if Site.all.any?
      @site = Site.last
      @news_source = NewsSource.new
      @news_sources = NewsSource.all
      @subscriber = Subscriber.new
      @categories = Category.includes(:items).where(items: { created_at: 1.day.ago..DateTime.now })
    else
      @site = Site.new
    end
  end
end
