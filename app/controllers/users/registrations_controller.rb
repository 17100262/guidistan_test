class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) {|u| 
  #    u.permit(:email, :password, :password_confirmation, :remember_me,:profile_attributes: [:name, :gender,:city])}
  #  end
  # end

  # GET /resource/sign_up
  def new
    # @profile = @user.profile.build

    # super
    build_resource({})
    self.resource.profile = Profile.new
    respond_with self.resource


  end

  # POST /resource
  def create
    # self.resource.profile.save!
    super
    SendEmailJob.perform_later(resource) unless resource.invalid?
    # BasicMailer.delay.welcome_email(resource) unless resource.invalid?
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  private
 
  def sign_up_params
    allow = [[profile_attributes:[:name,:gender,:city]], :email, :password, :password_confirmation, :remember_me]
    params.require(resource_name).permit(allow)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute],profiles_attribute: [:name,:gender,:city])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
