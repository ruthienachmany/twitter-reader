class TweetParser

  attr_accessor :user

  def initialize(user)
    @user = user
    @twitter_client = Twitter::Client.new(:login => user.twitter_handle, :oauth_token => user.auth_token, :oauth_token_secret => user.auth_token_secret, :consumer_key => ENV['TWITTER_CONSUMER_KEY'], :consumer_secret => ENV['TWITTER_CONSUMER_SECRET'], :include_entities => true)
  end


  def scrape_feed
      tweet = @twitter_client.home_timeline.each do |tweet|
        if Tweet.where(:tweet_id => tweet.id).empty?
          link = Link.new
          #debugger
          link.user_id = tweet.user.id
          #link.shortened_url = tweet.entities.url.urls.first.url
          #link.full_url = tweet.entities.url.urls.first.expanded_url
          text_split = tweet.text.split
          link.shortened_url = text_split.select! {|item| item.include?("http")}
          link.save!
        end
     end
  end

end


 # def scrape_commits
 #      result = @octokit_client.user_events(@student.github_username)
 #      result.each do |event|
 #        if event.type == "PushEvent"
 #          github_commit = GithubCommit.new
 #          github_commit.student_id = @student.id
 #          github_commit.commit_name = event.payload.commits.first.message
 #          github_commit.commit_repo = event.repo.name
 #          github_commit.commit_id = event.id
 #          github_commit.commit_published_at = event.created_at
 #          github_commit.save!