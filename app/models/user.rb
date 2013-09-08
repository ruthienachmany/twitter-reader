class User < ActiveRecord::Base



end
#   # Include default devise modules. Others available are:
#   # :token_authenticatable, :confirmable,
#   # :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable, :omniauthable,
#          :recoverable, :rememberable, :trackable, :validatable

#   # Setup accessible (or protected) attributes for your model
#   attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :twitter_handle, :auth_token, :auth_token_secret, :uid, :provider, :oauth_token, :oauth_verifier
#   validates_presence_of :username
#   validates_uniqueness_of :username
#   has_many :links

#   def self.twitter
#     where(:provider => 'twitter')
#   end

#   def self.from_omniauth(auth)
#     where(auth.slice(:provider, :uid)).first_or_create do |user|
#       user.provider = auth.provider
#       user.uid = auth.uid
#       user.username = auth.info.nickname
#     end
#   end

#   def self.create_from_omniauth(auth, user)
#     user.update_from_omniauth(auth)
#     user_attributes = {uid: auth['uid'], provider: auth['provider']}
#     case auth['provider']
#     when 'twitter'
#       user_attributes.merge!(:auth_token => auth.credentials.token)
#     end
#     user.identities.create(user_attributes)
#   end

#   def self.find_or_create_from_omniauth(auth, user = nil)
#     # if an identity with this auth details exists, just return the user
#     User.find_with_omniauth(auth) || (User.create_from_omniauth(auth, user) if user)
#   end

#   def self.new_with_session(params, session)
#     if session["devise.user_attributes"]
#       new(session["devise.user_attributes"], without_protection: true) do |user|
#         user.attributes = params
#         user.valid?
#       end
#     else
#       super
#     end    
#   end

# def update_with_password(params, *options)
#   if encrypted_password.blank?
#     update_attributes(params, *options)
#   else
#     super
#   end
# end

#   def update_from_omniauth(auth)
#     case auth['provider']
#     when 'twitter'
#       self.update_attributes(:twitter_handle => auth['info']['nickname'])
#     # when 'github'
#     #   self.update_attributes(:github_username => auth.extra["raw_info"]["login"])
#     # end
#     end
#   end
# end