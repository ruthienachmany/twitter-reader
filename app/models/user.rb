class User < ActiveRecord::Base
   attr_accessible :name, :twitter_handle, :auth_token, :auth_token_secret, :uid

   has_many :links

   def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

end
