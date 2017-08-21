class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment
    before_action :set_comment, only: [:upvote, :downvote]
    before_action :find_commentable
    layout false , only: [:upvote, :downvote]
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
	    	if @comment.commentable_type == "Comment"
	    		@comment.create_activity :create,{:commentable => @comment.commentable},{owner:current_user, recipient: @comment.commentable.commentable.user} #jis ki post hai usko notification
	    		# @comment.create_activity :create,{:commentable => @comment.commentable},{owner:current_user, recipient: @comment.commentable.commentable.user} #jis ke comment ka reply hai usko notificationn
	    	else
	    		@comment.create_activity :create,{:commentable => @comment.commentable},{owner:current_user, recipient: @comment.commentable.user}
	    	end
	    	redirect_to :back, notice: 'Your comment was successfully posted!'
	    else
	    	redirect_to :back, notice: "Your comment wasn't posted!"
	    end
	    
	end

	def edit

		# @comment = @commentable.comments.find(params[:id])
		@comment = Comment.find(params[:id])
	end

	def update
		# @comment = @commentable.comments.find(params[:id])
		@comment = Comment.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			# redirect_to post_path(@post)
			redirect_to getPostUrl
		else
			render 'edit'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.commentable_type == "Post"
			post = @comment.commentable_type
		elsif @comment.commentable_type == "Comment"
			post = @comment.commentable.commentable
		end
		@comment.destroy
		# @comment.create_activity :destroy, owner:current_user
		redirect_to getPostUrl
	end
    
	def upvote
		@comment.upvote_from current_user
		@comment.user.profile.update( :reputation => @comment.user.profile.reputation + 1)

		# redirect_to :back
	end
  
	def downvote
		@comment.downvote_from current_user
		@comment.user.profile.update( :reputation => @comment.user.profile.reputation - 1)

		# redirect_to :back
	end
	  
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_comment
		@comment = Comment.find(params[:id])
	end
	
	def comment_params
      params.require(:comment).permit(:comment,:user_id)
    end

	def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
    
    def getPostUrl
    	@post = @comment.commentable
    	if @post.respond_to?('commentable_type')
    		@comment = @post
    		getPostUrl
    	else
    		return forum_post_path(@post.forum,@post)
    	end
    end
end
