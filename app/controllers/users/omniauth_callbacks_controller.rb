class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts "the name
    .
    .
    .
    .
    .
    .
    .
    .",request.env["omniauth.auth"]
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    
    # if request.env["omniauth.auth"].info.email.blank?
    #   # flash.now[:notice] = 'Please Provide Email'
    #   redirect_to "/users/sign_in", alert: "Please Provide your E-mail Address"
    if ((!(request.env["omniauth.auth"].info.email.blank?)) and (User.exists?(:email => request.env["omniauth.auth"].info.email)) and (User.where(:email => request.env["omniauth.auth"].info.email).first.provider!="facebook" ) )
      # return redirect email is already token 
          redirect_to "/users/sign_in", alert: "email exists"
    else
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if (@user.persisted?)
          sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
          set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
      # session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
          redirect_to new_user_registration_url
        end
    end
  end
  
  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  
  end

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  
  end
  
  
  def failure
    redirect_to root_path
  end


  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
