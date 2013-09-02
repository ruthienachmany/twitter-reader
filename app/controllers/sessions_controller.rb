require 'rake'
require "net/http"
require "net/https"
require "uri"

class SessionsController < ApplicationController
   def create
    auth = request.env["omniauth.auth"] 
      # if auth
      #   user = User.find_with_omniauth(auth)
      # else 
        # if auth
          user = User.find_with_omniauth(auth)
        # else
          user = User.create(:auth_token => auth.extra.access_token.token, :auth_token_secret => auth.extra.access_token.secret, :uid => auth["uid"], :twitter_handle => auth["info"].nickname, :name => auth["info"].name, :provider => auth["provider"]) if user.nil?        
      # end
    puts "current user is #{current_user}"
    puts "user is #{user}"
    # puts User.find_or_create_from_omniauth(auth)
    #  current_user.update_from_omniauth(auth)
    #  session[:user_id] = user.id
    # # TweetParser.new(current_user).scrape_feed
    redirect_to root_url, notice: "Signed in."
    TweetParser.new(user).scrape_feed
    # Link.all.each do |link|
    #   link.full_url = link.full_link(link.shortened_url)
    # end
    # rake "get_urls:links"

    # @link.full_url = link.full_link(@link.shortened_url)
   
    # debugger
    # Link.all.each do |link|
    #   link.full_url(shortened_url)
    # end

   end


# auth["extra"]["access_token"].consumer.key
   
# auth["extra"]["access_token"].secret

 
#auth["extra"]["access_token"].token
#auth["extra"]["access_token"].secret

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end

  # def omniauth
  #   auth = request.env["omniauth.auth"]  
  #   case auth['provider']
  #   when 'twitter'
  #     TweetParser.new(current_user).scrape_feed
  # end

  #   redirect_to "/links"

end
