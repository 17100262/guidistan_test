class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:upvote, :downvote]
    before_action :find_commentable
    def create
		# @post = Post.find(params[:post_id])
		# @comment = @post.comments.create(params[:comment].permit(:comment))
		# @comment.user_id = current_user.id if current_user
		# @comment.save

		# if @comment.save
		# 	@comment.create_activity :create, owner:current_user
		# 	redirect_to post_path(@post)
		# else
		# 	render 'new'
		# end
		
		
		@comment = @commentable.comments.new comment_params
		@comment.user_id = current_user.id if current_user
	    if @comment.save
	    	redirect_to :back, notice: 'Your comment was successfully posted!'
	    else
	    	redirect_to :back, notice: "Your comment wasn't posted!"
	    end
	    
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		# @comment.create_activity :destroy, owner:current_user
		redirect_to post_path(@post)
	end
    
	def upvote
		@comment.upvote_from current_user
		redirect_to :back
	end
  
	def downvote
		@comment.downvote_from current_user
		redirect_to :back
	end
	  
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_comment
		@comment = Comment.find(params[:id])
	end
	
	def comment_params
      params.require(:comment).permit(:comment)
    end

	def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end
