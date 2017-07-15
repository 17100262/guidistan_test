class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  load_and_authorize_resource
  impressionist actions: [:show], unique: [:session_hash]
  layout false , only: [:upvote, :downvote]
  # GET /posts
  # GET /posts.json
  def index
    @profiles = Profile.all.order(reputation: :desc).limit(5)
    @id = params[:filter_id]
    
    if params[:tag]!=nil and params[:filter_id]!=nil
      @posts = Post.tagged_with(params[:tag]).where(forum_id: params["filter_id"]).paginate(:page => params[:page],:per_page => 5)
    elsif (params[:filter_id] == nil)
      # @posts = Post.all.order("created_at DESC").

      @posts = Post.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    else
    # puts params[:filter_id], "helellaelasdlalsd"
      @posts = Post.where(forum_id: params[:filter_id]).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @id = @post.forum_id  
  end

  # GET /posts/new
  def new
    @post = Post.new
    @@dis_id = params[:forum_id]
    @id = params[:forum_id]
    @options = { tokenValue: 'name' }
    
    @names = ActsAsTaggableOn::Tag.all.map{|t| {id: t.id,name: t.name} }
  end

  # GET /posts/1/edit
  def edit
    @names = ActsAsTaggableOn::Tag.all.map{|t| {id: t.id,name: t.name} }
    @options = { tokenValue: 'name', prePopulate: @post.tag_list.map{|t| {name: t} } }
  end
  
  
  # POST /posts
  # POST /posts.json
  def create
    # puts @post.discipline_id,"hello"
    puts post_params ,"head asdads"
    @post = Post.new(post_params)
    # puts @id,'adasdasds'
    @post.user_id = current_user.id
    @post.forum_id = @@dis_id
    
    
    
    respond_to do |format|
      if @post.save
        # format.json {render json: @names}
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      @post.user_id = current_user.id
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url(:filter_id => params[:forumm_id]), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_from current_user
    @post.user.profile.update( :reputation => @post.user.profile.reputation + 1)
    # @post.create_activity :like ,{owner:current_user, recipient: @post.user}
    # @post.downvote_from current_user
    # redirect_to :back
  end
  
  def downvote
    @post.downvote_from current_user
    
    @post.user.profile.update( :reputation => @post.user.profile.reputation - 1)
    # if @post.get_downvotes.size > 0
    #   puts @post.flagi
    #   puts "lalalalalalalalalalalalalal"
    #   @post.flagi = true
    #   puts @post.flagi
    # end
    # redirect_to :back
  end
  
  def count
    # @post.upvote_from current_user
    # @post.downvote_from current_user
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description,:forum_id, :filter_id,{:tag_list=>[]} ,:tag, :flagi)
    end
end
