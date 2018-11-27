class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @subscriber = Subscriber.new
    @categories = Category.includes(:items).where(items: { created_at: 1.day.ago..DateTime.now })
    # @items = Item.all
  end
end
