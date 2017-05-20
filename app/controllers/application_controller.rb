class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  force_ssl :protocol => "https"
  include PublicActivity::StoreController
  
  before_action :set_activities

  def set_activities
    @activities1 = PublicActivity::Activity.all.order("created_at desc").where(recipient_id:current_user).where.not(owner_id:current_user).limit(4)
    # puts "hello application",@activities
  end

end
