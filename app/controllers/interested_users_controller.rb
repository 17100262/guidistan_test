class InterestedUsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_action :authenticate_user!
  
  
  def index
    @users = InterestedUser.all.order('name ASC')
  end

  def new
    @user = InterestedUser.new
  end
  
  def create
    @user = InterestedUser.new(interested_user_params)
    @user.email = current_user.email
    @user.name = current_user.profile.name
    @user.user_id = current_user.id

    respond_to do |format|
      if @user.save
        format.html { redirect_to :back, notice: 'Application Submitted Successfully.A relevant Counselor will contact you soon.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  

  def destroy
  end

  def delete
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = InterestedUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interested_user_params
    params.require(:interested_user).permit(:name, :email, :phone_number,:universities,:address,:user_id, :package)
  end
end
