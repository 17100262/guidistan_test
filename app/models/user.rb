class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :comments
  has_one :profile
  accepts_nested_attributes_for :profile
  # For OmniAuth-Facebook
  # devise :omniauthable, :omniauth_providers => [:facebook,:twitter]
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     # user.profile.name = auth.info.name   # assuming the user model has a name
  #     # user.profile.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails, 
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end
  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #     # if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
  #     #   user.email = data["email"] if user.email.blank?
  #     # end
  #   end
  # end
  
  
end
