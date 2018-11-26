class HomeController < ApplicationController
  def index
    @categories = Category.includes(:items).where(items: { created_at: 1.day.ago..DateTime.now })
    # @items = Item.all
  end
end
