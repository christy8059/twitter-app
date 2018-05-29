require 'rufus-scheduler'
require 'twitter'

class Tweet_Stuff
    @@client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  "soW6TnDmRN8uZmaUnpPMqA5GM" #ENV["TWITTER_KEY"]
      config.consumer_secret     =  "kxfSBroeDchfouuISDAaG5ElSowtExPwUXMX8ERWoRY38ecv9Z" #ENV["TWITTER_SECRET"]
      config.access_token        =  "998982729021603840-i4u0tZAPX6OGt0H9yZuDwKfC0ULe5T3" #ENV["TWITTER_TOKEN"]
      config.access_token_secret =  "bEyOtI2yj1Vfj1hvvbW9lPHJWZhu02t6rO18QyrA4xCan" #ENV["TWITTER_TOKEN_SECRET"]
    end
    
    @@scheduler = Rufus::Scheduler.new
    
    def initialize(name)
        @name = name
        
    end
    def checkFollowers(user)
       @@client.user("#{user}").followers_count 
    end
    def tweet(str)
       @@client.update(str) 
    end
    def retweetTimer(frequency,searchTerm)
        @@scheduler.every "#{frequency}m" do 
            @@client.search("##{searchTerm}").each do |tweet|
            @@client.retweet(tweet) 
            end
        end
        @@scheduler.join
    end
    def directMessage(user,message)
        @@client.follow(user)
        @@client.create_direct_message("@#{user}",message) 
    end
end

# christy = Tweet_Stuff.new("Christy")
# christy.retweetTimer("5","supreme")


