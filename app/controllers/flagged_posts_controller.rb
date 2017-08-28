class FlaggedPostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
    @post= FlaggedPost.new
  end

  def create
    @post = FlaggedPost.new(post_params)
    if @post.save
      redirect_to :back, notice: "Post Flagged Successfully"
    end
  end

  def index
    @posts = FlaggedPost.all
  end

  def delete
  end
  def flag_this
    FlaggedPost.create(post_id: params[:id])
    redirect_to :back, notice: "Post Flagged Successfully"
  end
  def destroy
    @post.post.destroy
    @post.destroy
    respond_to do |format|
        format.html { redirect_to '/flagged_posts', notice: 'Post was successfully destroyed.' }
      
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = FlaggedPost.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:flagged_post).permit(:post_id)
    end

end
