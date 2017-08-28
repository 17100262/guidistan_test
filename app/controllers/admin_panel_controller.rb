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
    @posts = FlaggedPost.all
  end
  def del_post
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/admin_panel/flag', notice: 'Post was successfully destroyed.' 
  end
  def make_mod
    Profile.find(params[:id]).user.add_role :moderator
    redirect_to '/profiles', notice: 'Role successfully updated to Moderator.' 
    
  end
  def remove_mod
    if (Profile.find(params[:id]).user.has_role? :moderator)
      Profile.find(params[:id]).user.remove_role :moderator
      redirect_to '/profiles', notice: 'Role successfully Removed'
    else
      redirect_to '/profiles'
    end
    # Profile.find(params[:id]).user.add_role :moderator
    
    
  end
end
