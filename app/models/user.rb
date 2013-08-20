class User < ActiveRecord::Base
   attr_accessible :name, :twitter_handle, :auth_token, :auth_token_secret, :user_id

   has_many :links

end
