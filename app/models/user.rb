class User < ApplicationRecord
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :email,uniqueness: true 
  validates :username,uniqueness: true
  devise :database_authenticatable, :authentication_keys => [:username]
  devise :database_authenticatable, :validatable, password_length: 9..128
 validates :username,length: {maximum: 13}
 has_many :comments
 has_many :posts
 
 def remember_me
    true
  end
def self.from_omniauth(access_token)
  data = access_token.info
  user = User.where(:username => data["username"]).first

  unless user
    password = Devise.friendly_token[0,20]
    user = User.create( email: data["email"],username: data["username"],
      password: password, password_confirmation: password
    )
  end
  user
end

end
