class AdminPanelController < ApplicationController
  before_action :authenticate_user!
  layout false
  
  def index
    if not current_user.has_role?(:admin)
      
    # else
      flash[:notice] = "You don't have access to view this page"
      redirect_to  disciplines_path
    end
  end
end
