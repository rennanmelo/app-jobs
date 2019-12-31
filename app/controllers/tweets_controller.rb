class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "7qqGDH7sx46zexxmoko3QRwmJ"
      config.consumer_secret     = "afxajxGZt5nzkRQm5V0tosaRtqwQCKpslm8lzxCB2bAJSxXa19"
      config.access_token        = "1030183222909526016-wMcHUrXSjXn8RUOnsIk6MT9kHObM59"
      config.access_token_secret = "rTZ5qXrxQtKGSCjreewZvqybdHXrGLC9Z67H95EzzbCNW"
    end

    client.search('#rails #jobs -rt').each do |tweet|
      puts "#{tweet.user.name} - #{tweet.text} - #{tweet.url} - #{tweet.created_at}"      
      puts "----------------------------------"   
    end
  end
end
