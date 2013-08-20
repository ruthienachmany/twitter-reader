class Link < ActiveRecord::Base
   attr_accessible :shortened_url, :full_url, :time_posted_at

   belongs_to :user


end
