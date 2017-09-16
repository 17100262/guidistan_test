class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy,:wishlist]
  before_action :authenticate_user!,except:[:index,:show]
  load_and_authorize_resource

  def index
    @universities = University.all.order('name ASC')
    @meta_title = meta_title 'Browse Information for all universities of Pakistan'
    @meta_description = "Browse Information for all universities of Pakistan"
  end


  def show
    # @discipline = @university.degreeprogram.discipline
    @city = City.find(@university.city_id).name
    @discipline = @university.discipline.distinct
  end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
  end


  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def wishlist
    
    if (WishlistUniversity.exists?(:user_id => current_user.id,:university_id =>  @university.id))
      WishlistUniversity.where(:user_id => current_user.id,:university_id =>  @university.id).destroy_all
      redirect_to "/universities/#{@university.id}", notice: "University removed from wishlist"
    else
      WishlistUniversity.create(:user_id => current_user.id,:university_id =>  @university.id)
      redirect_to "/universities/#{@university.id}", notice: "University added to wishlist"
    end
  end
  
  def import
    University.import(params[:file])
    redirect_to universities_path, notice: "Universities imported"
  end
 
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name","description","city_id","link","campus","number","email","facebook","address"]
      @unis=University.all
      @unis.each do |dp|
        sheet.add_row [dp.name,dp.description,City.find(dp.city_id).name,dp.name,dp.campus,dp.number,dp.email,dp.facebook,dp.address]
      end
    end
    send_data package.to_stream.read, :filename => "Universities.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:name, :description, :city_id,:number,:email,:facebook,:address,:image_file_name, :image_content_type,:image_file_size,:image_updated_at, :image)
    end
end
