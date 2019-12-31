class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "7qqGDH7sx46zexxmoko3QRwmJ"
      config.consumer_secret     = "afxajxGZt5nzkRQm5V0tosaRtqwQCKpslm8lzxCB2bAJSxXa19"
      config.access_token        = "1030183222909526016-wMcHUrXSjXn8RUOnsIk6MT9kHObM59"
      config.access_token_secret = "rTZ5qXrxQtKGSCjreewZvqybdHXrGLC9Z67H95EzzbCNW"
    end

    # Get all the tweets that have #rails and #jobs from the last 7 days, excluding retweets
    client.search('#rails #jobs -rt').each do |tweet|
      new_tweet = Tweet.new
      already_exist = Tweet.find_by_text(tweet.text)
      
      # Check if the tweet already exist before save
      if already_exist == nil
        new_tweet.user = tweet.user.name
        new_tweet.text = tweet.text
        new_tweet.date = tweet.created_at
        new_tweet.url = tweet.url
        new_tweet.save
      end
    end
  end
end
