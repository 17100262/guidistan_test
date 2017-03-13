class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  authorize_resource :class => false  
  def index
    @tags = ActsAsTaggableOn::Tag.all
    @tag = ActsAsTaggableOn::Tag.new
  end

  def show
    # @university = @city.university
  end

  # GET /cities/new
  def new
    @tag = ActsAsTaggableOn::Tag.new
  end
  
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @tag = ActsAsTaggableOn::Tag.new(tag_params)
    # @tag.tagging_count = 0

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_url, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :index }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_url, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.delete
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def set_tag
      @tag = ActsAsTaggableOn::Tag.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.permit(:name,:id,:taggings_count)
    end
end

