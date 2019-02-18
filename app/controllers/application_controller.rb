class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_cookie, :get_site

  def check_cookie
    if cookies[:liker]
      @liker = cookies[:liker]
    else
      cookies[:liker]=SecureRandom.hex
      @liker = cookies[:liker]
    end
  end

  def get_site
    @site = Site.last
  end
end
