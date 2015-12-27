class HomeController < ApplicationController
  def index
    Rails.logger.info 'Nothing to Do here!'
  end

  def shorten
    expires_at = params[:expires_at]
    long_url = params[:shorten][:url]
    uri = URI.parse(long_url)

    uri = "http://#{uri.to_s}" unless valid? uri
    Shortener::ShortenedUrl.generate(uri, owner: current_user, expires_at: 24.hours.since)
    redirect_to root_path
  end

  def valid?(uri)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
end
