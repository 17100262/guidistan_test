class DisciplineUniversitiesController < ApplicationController
  before_action :set_discipline_university, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  load_and_authorize_resource

  # GET /discipline_universities
  # GET /discipline_universities.json
  def index
    @discipline_universities = DisciplineUniversity.all
  end

  # GET /discipline_universities/1
  # GET /discipline_universities/1.json
  def show
    # puts params[:discipline][:id]
  end

  # GET /discipline_universities/new
  def new
    @discipline_university = DisciplineUniversity.new
  end

  # GET /discipline_universities/1/edit
  def edit
  end

  # POST /discipline_universities
  # POST /discipline_universities.json
  def create
    @discipline_university = DisciplineUniversity.new(discipline_university_params)

    respond_to do |format|
      if @discipline_university.save
        format.html { redirect_to @discipline_university, notice: 'Discipline university was successfully created.' }
        format.json { render :show, status: :created, location: @discipline_university }
      else
        format.html { render :new }
        format.json { render json: @discipline_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discipline_universities/1
  # PATCH/PUT /discipline_universities/1.json
  def update
    respond_to do |format|
      if @discipline_university.update(discipline_university_params)
        format.html { redirect_to @discipline_university, notice: 'Discipline university was successfully updated.' }
        format.json { render :show, status: :ok, location: @discipline_university }
      else
        format.html { render :edit }
        format.json { render json: @discipline_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discipline_universities/1
  # DELETE /discipline_universities/1.json
  def destroy
    @discipline_university.destroy
    respond_to do |format|
      format.html { redirect_to discipline_universities_url, notice: 'Discipline university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline_university
      @discipline_university = DisciplineUniversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_university_params
      params.require(:discipline_university).permit(:university_id, :discipline_id, :degreeprogram_id, :subdiscipline_id)
    end
end
