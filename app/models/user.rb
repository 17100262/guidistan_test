class User < ActiveRecord::Base
  # after_create :send_welcome_mail
  # def send_welcome_mail
  #   SendEmailJob.set(wait: 20.seconds).perform_later(self.email)    
  # end

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :interested_user, dependent: :destroy
  accepts_nested_attributes_for :profile
  acts_as_voter
  # For OmniAuth-Facebook
  devise :omniauthable, :omniauth_providers => [:facebook,:twitter,:google_oauth2]
  def self.from_omniauth(auth)
    check = false
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      check = true
      
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
    
    if check
      profile= Profile.new
      profile.name = auth.info.name   # assuming the user model has a name
      profile.image = auth.info.image # assuming the user model has an image
      profile.gender = auth.extra.raw_info.gender # assuming the user model has an image
      profile.user_id = user.id
      profile.save!
    end
    return user

  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      # if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
      #   user.email = data["email"] if user.email.blank?
      # end
    end
  end
  
  
end
