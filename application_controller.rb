require 'rufus-scheduler'
require 'twitter'
require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/twitterbot.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    @user_name = params["name"]
    @user_tweet = params["tweetStr"]
    @user_follower = params["followerCount"]
    @user_search = params["search"]
    @user_timer = params["time"]
    @user_account = params["account"]
    @user_message = params["message"]
    @usage = params["option"]
    @tweetStuff = Tweet_Stuff.new(@user_name)
    if @usage == "tweet"
      @tweetStuff.tweet(@user_tweet)
    elsif @usage == "follower"
      @followers = @tweetStuff.checkFollowers(@user_follower)
    elsif @usage == "retweetTimer"
      @tweetStuff.retweetTimer(@user_timer,@user_search)
    else
      @tweetStuff.directMessage(@user_account,@user_message)
    end
    erb :result
  end
end

# link to twitter account
# https://twitter.com/Anonymo37841143
# @Anonymo37841143
