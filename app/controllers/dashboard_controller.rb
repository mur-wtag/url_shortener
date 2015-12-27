class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @urls = current_user.shortened_urls
  end
end
