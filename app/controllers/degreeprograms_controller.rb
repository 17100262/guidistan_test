class DegreeprogramsController < ApplicationController
  before_action :set_degreeprogram, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  load_and_authorize_resource

  # GET /degreeprograms
  # GET /degreeprograms.json
  def index
    @degreeprograms = Degreeprogram.all
  end

  # GET /degreeprograms/1
  # GET /degreeprograms/1.json
  def show
  end

  # GET /degreeprograms/new
  def new
    @degreeprogram = Degreeprogram.new
  end

  # GET /degreeprograms/1/edit
  def edit
  end

  # POST /degreeprograms
  # POST /degreeprograms.json
  def create
    @degreeprogram = Degreeprogram.new(degreeprogram_params)

    respond_to do |format|
      if @degreeprogram.save
        format.html { redirect_to @degreeprogram, notice: 'Degreeprogram was successfully created.' }
        format.json { render :show, status: :created, location: @degreeprogram }
      else
        format.html { render :new }
        format.json { render json: @degreeprogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /degreeprograms/1
  # PATCH/PUT /degreeprograms/1.json
  def update
    respond_to do |format|
      if @degreeprogram.update(degreeprogram_params)
        format.html { redirect_to @degreeprogram, notice: 'Degreeprogram was successfully updated.' }
        format.json { render :show, status: :ok, location: @degreeprogram }
      else
        format.html { render :edit }
        format.json { render json: @degreeprogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /degreeprograms/1
  # DELETE /degreeprograms/1.json
  def destroy
    @degreeprogram.destroy
    respond_to do |format|
      format.html { redirect_to degreeprograms_url, notice: 'Degreeprogram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_degreeprogram
      @degreeprogram = Degreeprogram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def degreeprogram_params
      params.require(:degreeprogram).permit(:degree_type, :name, :subdiscipline_id, :discipline_id)
    end
end
