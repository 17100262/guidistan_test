class ForumsController < ApplicationController
	before_action :set_discipline, only: [:show, :edit, :update, :destroy]

    def index
        # @disciplines = Discipline.all
        @forums = Forum.all
    end
    def new
		@forum = Forum.new
	end

  	def edit
  	end
  	
  	def create
    	@forum = Forum.new(forum_params)

	    respond_to do |format|
	      if @forum.save
	        format.html { redirect_to forums_url, notice: 'Forum was successfully created.' }
	        format.json { render :show, status: :created, location: @forum }
	      else
	        format.html { render :new }
	        format.json { render json: @forum.errors, status: :unprocessable_entity }
	      end
    	end
  	end

	def update
	    
	    respond_to do |format|
	      if @forum.update(forum_params)
	        format.html { redirect_to forums_url, notice: 'Forum was successfully updated.' }
	        format.json { render :show, status: :ok, location: @forum }
	        # format.js {locals: @forum}
	      else
	        format.html { render :edit }
	        format.json { render json: @forum.errors, status: :unprocessable_entity }
	      end
	    end
	  
	 end

  	def destroy
    	@forum.destroy
    	respond_to do |format|
      		format.html { redirect_to forums_url, notice: 'Forum was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

  	def set_discipline
      @forum = Forum.friendly.find(params[:id])
    end
    
    def forum_params
    	if params[:forum][:image]==""
        	params.require(:forum).permit(:name)
    	else
        	params.require(:forum).permit(:name, :image_file_name, :image_content_type,:image_file_size,:image_updated_at, :image)
    	end
    end
end
