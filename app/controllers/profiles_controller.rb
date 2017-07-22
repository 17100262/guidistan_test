class ProfilesController < ApplicationController
    impressionist actions: [:show], unique: [:session_hash]
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        SendEmailJob.set(wait: 5.seconds).perform_later(@profile.user.email)
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
    @names = Discipline.all.map{|record|  {id: record.id,name: record.name}}
    # puts @names
    # @options = { tokenValue: 'id' }
    @options = { tokenValue: 'id', prePopulate: @profile.student_interests_discipline.map{|t| {name:t.discipline.name,id: t.discipline_id} } }
  end

  def update
    @profile = Profile.find(params[:id])
    # all_interests = @profile.student_interests_discipline
    
    @profile.student_interests_discipline.destroy_all
    
    # params[:profile][:interest_attributes][:interest_list].compact!
    # puts params[:profile][:interest_attributes][:interest_list],"compact list"
    params[:profile][:interest_attributes][:interest_list].each do |i|
      if(i!="")
        @profile.student_interests_discipline.create(discipline_id:i).save!
      end
    end
    # params[:profile][:interest_attributes][:interest_list].map{|r| @profile.student_interests_discipline.create(discipline_id:r).save!}
    params[:profile].delete(:interest_attributes)
    # puts @profile.student_interests_discipline
    @profile.errors.full_messages.each do |message|
      puts message,"here"
    end
    
    
    
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    # @profile = Profile.find(params[:id])
  end

  def destroy
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
    # if @user
      @user.destroy
    # end
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name,:gender,:city_id,:image_file_name, :image_content_type,:image_file_size,:image_updated_at, :image,[interest_attributes:[{:interest_list=>[]}]])
    end
end
