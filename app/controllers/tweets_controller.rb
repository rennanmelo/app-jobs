class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter_api[:consumer_key]
      config.consumer_secret     = Rails.application.credentials.twitter_api[:consumer_secret]
      config.access_token        = Rails.application.credentials.twitter_api[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter_api[:access_token_secret]
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

    @tweets = Tweet.all
  end
end
