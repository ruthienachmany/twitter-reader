class TweetParser
  # attr_accessible :title, :body

  attr_accessor :user

  def initialize(user)
    @user = user
  end


  def scrape_feed
      Twitter.home_timeline.each do |tweet|

        if Tweet.where(:tweet_id => tweet.id).empty?
          link = Link.new
          link.user_id = user.id
          link.shortened_url = tweet.entities.url.urls.first.url
          link.full_url = tweet.entities.url.urls.first.expanded_url
          link.save!
        end
     end
  end

end


def scrape_feed
      Twitter.home_timeline("ruthienachmany", options = {:count => 200}).each do |tweet|

        if Tweet.where(:tweet_id => tweet.id).empty?
          link = Link.new
          link.user_id = user.id
          link.shortened_url = tweet.entities.url.urls.first.url
          link.full_url = tweet.entities.url.urls.first.expanded_url
          link.save!
        end
     end
  end

  def scrape_feed
      Twitter.home_timeline(user.twitter_handle, options = {:count => 200}).each do |tweet|
        puts tweet
      end
  end