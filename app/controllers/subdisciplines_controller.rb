class SubdisciplinesController < ApplicationController
  before_action :set_subdiscipline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,except:[:index,:show]
  load_and_authorize_resource
  # GET /subdisciplines
  # GET /subdisciplines.json
  def index
    @subdisciplines = Subdiscipline.all.order('name ASC')
  end

  # GET /subdisciplines/1
  # GET /subdisciplines/1.json
  def show
    puts "here asdasdas"
    # begin 
    #   @subdiscipline.degreeprogram
    # rescue
    # else
      @degree = @subdiscipline.discipline_university.distinct
    # end
  end

  # GET /subdisciplines/new
  def new
    @subdiscipline = Subdiscipline.new
  end

  # GET /subdisciplines/1/edit
  def edit
  end

  # POST /subdisciplines
  # POST /subdisciplines.json
  def create
    @subdiscipline = Subdiscipline.new(subdiscipline_params)
    respond_to do |format|
      if @subdiscipline.save
        format.html { redirect_to @subdiscipline, notice: 'Subdiscipline was successfully created.' }
        format.json { render :show, status: :created, location: @subdiscipline }
      else
        format.html { render :new }
        format.json { render json: @subdiscipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdisciplines/1
  # PATCH/PUT /subdisciplines/1.json
  def update
    respond_to do |format|
      if @subdiscipline.update(subdiscipline_params)
        format.html { redirect_to @subdiscipline, notice: 'Subdiscipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @subdiscipline }
      else
        format.html { render :edit }
        format.json { render json: @subdiscipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdisciplines/1
  # DELETE /subdisciplines/1.json
  def destroy
    @subdiscipline.destroy
    respond_to do |format|
      format.html { redirect_to subdisciplines_url, notice: 'Subdiscipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Subdiscipline.import(params[:file])
    redirect_to subdisciplines_path, notice: "SubDisciplines imported"
  end
  
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name","discipline_id","description"]
      @subdisciplines=Subdiscipline.all
      @subdisciplines.each do |dp|
        sheet.add_row [dp.name,Discipline.find(dp.discipline_id).name,dp.description]
      end
    end
    send_data package.to_stream.read, :filename => "SubDisciplines.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdiscipline
      @subdiscipline = Subdiscipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subdiscipline_params
      params.require(:subdiscipline).permit(:name, :discipline_id, :description)
    end
end
