class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @news_source = NewsSource.new
    @news_sources = NewsSource.all
    @subscriber = Subscriber.new
    @categories = Category.includes(:items).where(items: { created_at: 1.day.ago..DateTime.now })
    # @items = Item.all
  end
end
