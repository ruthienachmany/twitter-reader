require 'debugger'
require "net/http"
require "net/https"
require "uri"
class TweetParser

attr_accessor :user, :link

@urls = []

  def initialize(user)
    @user = user
    @twitter_client = Twitter::Client.new(:login => user.twitter_handle, :oauth_token => user.auth_token, :oauth_token_secret => user.auth_token_secret, :consumer_key => ENV['TWITTER_CONSUMER_KEY'], :consumer_secret => ENV['TWITTER_CONSUMER_SECRET'], :count => 200, :include_entities => true)
  end


  def scrape_feed
      tweet = @twitter_client.home_timeline.each do |tweet|
        if Tweet.where(:tweet_id => tweet.id).empty?
          @link = Link.new
          text_split = tweet.text.split
          array_link = text_split.select! {|item| item.include?("http")}
          @link.shortened_url = array_link.first if array_link
          if @link.shortened_url 
            then @link.full_url = @link.full_link(@link.shortened_url)
          @link.save! if @link.shortened_url
        end
     end
  end

   def full_link(shortened_url)
      url = shortened_url
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
        until response.code == "200"
          url = response.header['location']
          @urls << url
          uri = URI.parse(url)
          if uri.scheme == "https"
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(uri.request_uri)
            response = http.request(request)
          else
            response = Net::HTTP.get_response(uri)
        end
      return @urls[-1]
    end  
  end

  # def scrape_feed
  #     tweet = @twitter_client.home_timeline.each do |tweet|
  #       if Tweet.where(:tweet_id => tweet.id).empty?
  #         @link = Link.new
  #         #debugger
  #         #link.user_id = tweet.user.id
  #         #link.shortened_url = tweet.entities.url.urls.first.url
  #         #link.full_url = tweet.entities.url.urls.first.expanded_url
  #         text_split = tweet.text.split
  #         array_link = text_split.select! {|item| item.include?("http")}
  #         @link.shortened_url = array_link.first if array_link
  #         # debugger
  #         if @link.shortened_url 
  #           then @link.full_url = @link.full_link(@link.shortened_url)
  #         @link.save! if @link.shortened_url
  #       end
  #    end
  #    #rake "get_urls:links"
  # end

end
end
