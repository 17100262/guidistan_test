class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all.order('name ASC')
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @university = @city.university
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    City.import(params[:file])
    redirect_to cities_path, notice: "Cities imported"
  end

  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name"]
      @cities=City.all
      @cities.each do |ct|
        sheet.add_row [ct.name]
      end
    end
    send_data package.to_stream.read, :filename => "cities.xlsx"
  end
  private

    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name)
    end
end
