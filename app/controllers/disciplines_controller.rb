class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /disciplines
  # GET /disciplines.json
  def index
    @subs = Subdiscipline.where(discipline_id: params[:discipline_id])
    @disciplines = Discipline.all.order('name ASC')
    @universities = University.all.limit(10)
    @meta_title = meta_title 'Browse Information for all universities of Pakistan'
    @meta_description = "Browse Information for all universities of Pakistan"
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
    @degrees = @discipline.discipline_university.limit(4)
    @sub = Subdiscipline.where(discipline_id:@discipline.id)
    # @universities = @discipline.university.distinct
    if (current_user!=nil)
      ahoy.track "Clicked Discipline", {title: @discipline.name,id:@discipline.id}
    end
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Discipline was successfully created.' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Discipline.import(params[:file])
    redirect_to disciplines_path, notice: "Disciplines imported"
  end
  
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name","description","font"]
      @disciplines=Discipline.all
      @disciplines.each do |dp|
        sheet.add_row [dp.name,dp.description,dp.font]
      end
    end
    send_data package.to_stream.read, :filename => "Disciplines.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:name, :description,:font, :image_file_name, :image_content_type,:image_file_size,:image_updated_at, :image)
    end
end
