class SessionsController < ApplicationController
   def create
    auth = request.env["omniauth.auth"]  
    user = User.find_or_create_from_omniauth(auth, current_user)
    # current_user.update_from_omniauth(auth)
     session[:user_id] = user.id
    # TweetParser.new(current_user).scrape_feed
     redirect_to root_url, notice: "Signed in."
   end

 
   

 


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
