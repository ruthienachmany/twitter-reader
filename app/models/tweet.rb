class Tweet < ActiveRecord::Base
   attr_accessible :tweet_published_at, :tweet_id

  # belongs_to :user
  # has_many :links

end
