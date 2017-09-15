class NgosController < ApplicationController
    before_action :set_ngo, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!,except:[:index,:show]
    load_and_authorize_resource
    def index
      # @ngos = Ngo.all.order('name ASC')
      @ngos =Ngo.search(params[:level])
    end


    def show
        # @city = City.find(@ngo.city_id).name
        # @discipline = @ngo.discipline.distinct
    end

  # GET /universities/new
  def new
    @ngo = Ngo.new
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities
  # POST /universities.json
  def create
    @ngo = Ngo.new(ngo_params)
    

    respond_to do |format|
      if @ngo.save
        format.html { redirect_to @ngo, notice: 'Ngo was successfully created.' }
        format.json { render :show, status: :created, location: @ngo }
      else
        format.html { render :new }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    respond_to do |format|
      if @ngo.update(ngo_params)
        format.html { redirect_to @ngo, notice: 'Ngo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ngo }
      else
        format.html { render :edit }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ngo.destroy
    respond_to do |format|
      format.html { redirect_to ngos_url, notice: 'Ngo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Ngo.import(params[:file])
    redirect_to ngos_path, notice: "NGOs imported"
  end
 
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name","description","category","procedure","criteria","link","last date","how to apply"]
      @ngos=Ngo.all
      @ngos.each do |dp|
        sheet.add_row [dp.name,dp.description,dp.category,dp.procedure,dp.criteria,dp.link,dp.lastdate,dp.procedure]
      end
    end
    send_data package.to_stream.read, :filename => "NGOs.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ngo
      @ngo = Ngo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ngo_params
      params.require(:ngo).permit(:name, :level,:description, :category,:lastdate,:procedure,:link,:criteria, :image_file_name, :image_content_type,:image_file_size,:image_updated_at)
    end
end
