class Link < ActiveRecord::Base
   attr_accessible :twitter_url, :full_url

   belongs_to :user

end
