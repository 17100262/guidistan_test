class AdminPanelController < ApplicationController
  before_action :authenticate_user!
 
  
  def index
    if not current_user.has_role?(:admin)
      
    # else
      flash[:notice] = "You don't have access to view this page"
      redirect_to  root
    end
  end
  def flag
    @post = Post.where(flagi: true)
  end
end
