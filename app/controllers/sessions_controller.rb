class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_omniauth(params[:twitter_handle])
    # Authenticate is a Rails Helper method
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      redirect_to login_path, notice: "Email or password is invalid"
    end
  end

  # def omniauth
  
  #   auth = request.env["omniauth.auth"]  
  #   identity = Identity.find_or_create_from_omniauth(auth, current_student)

  #   current_student.update_from_omniauth(auth)
  #   case auth['provider']
  #   when 'twitter'
  #     TweetScraper.new(current_student).scrape_feed # if auth['provider'] == 'twitter'

  #   when 'github'
  #     # redirect_to '/students/5'
  #     #current_student.update_from_omniauth(auth)

  #    # GithubCommitScraper.new(current_student).scrape_commits
  #     puts GithubCommitScraper.new(current_student).scrape_commits
     

  #     # Make authenticated request using octokit and the auth['secret_auth_for_github']
  #     # to get the users commits.
  #   end

  #   redirect_to "/students/#{current_student.id}"
  #   #redirect_to 'students/1'

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end