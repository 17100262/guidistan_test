class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,except:[:index,:show]
  load_and_authorize_resource
  # GET /universities
  # GET /universities.json
  def index
    @universities = University.all.order('name ASC')
  end

  # GET /universities/1
  # GET /universities/1.json
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

  # POST /universities
  # POST /universities.json
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

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
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

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
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
      sheet.add_row ["name","description","city_id"]
      @unis=University.all
      @unis.each do |dp|
        sheet.add_row [dp.name,dp.description,City.find(dp.city_id).name]
      end
    end
    send_data package.to_stream.read, :filename => "Universities.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:name, :description, :city_id, :image_file_name, :image_content_type,:image_file_size,:image_updated_at, :image)
    end
end
