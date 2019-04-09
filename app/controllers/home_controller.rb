class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:tag]
      @posts = Post.order(pub_date: :desc).tagged_with(params[:tag])
    else
      @posts = Post.order(pub_date: :desc)
    end
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
