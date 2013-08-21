class User < ActiveRecord::Base
   attr_accessible :name, :twitter_handle, :auth_token, :auth_token_secret, :uid, :provider, :oauth_token, :oauth_verifier

   has_many :links

#    def self.from_omniauth(auth)
#     where(auth.slice("uid")).first || create_from_omniauth(auth)
#   end
  
#   def self.create_from_omniauth(auth)
#     create! do |user| 
#       user.uid = auth["uid"]
#       user.twitter_handle = auth["info"]["nickname"]
#     end
#   end

# end

  def self.twitter
    where(:provider => 'twitter')
  end

  def self.find_with_omniauth(auth)
    where(:provider => auth['provider'], :uid => auth['uid']).first
  end

  def self.create_from_omniauth(auth, user)
    user.update_from_omniauth(auth)
    user_attributes = {uid: auth['uid'], provider: auth['provider']}
    case auth['provider']
    when 'twitter'
      user_attributes.merge!(:auth_token => auth.credentials.token)
    end
    user.identities.create(user_attributes)
  end

  def self.find_or_create_from_omniauth(auth, user = nil)
    # if an identity with this auth details exists, just return the user
    User.find_with_omniauth(auth) || (User.create_from_omniauth(auth, user) if user)
  end

  def update_from_omniauth(auth)
    case auth['provider']
    when 'twitter'
      self.update_attributes(:twitter_handle => auth['info']['nickname'])
    # when 'github'
    #   self.update_attributes(:github_username => auth.extra["raw_info"]["login"])
    # end
    end
  end
end