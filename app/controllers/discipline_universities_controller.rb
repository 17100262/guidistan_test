class DisciplineUniversitiesController < ApplicationController
  before_action :set_discipline_university, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  load_and_authorize_resource

  # GET /discipline_universities
  # GET /discipline_universities.json
  def index
    # @discipline_universities = DisciplineUniversity.all
    
    @filterrific = initialize_filterrific(
      DisciplineUniversity,
      params[:filterrific]
    ) or return

    # puts params[:discipline_university] == nil,"check"

    if params[:discipline_university].present?
      if params[:discipline_university][:discipline_ids].all?{|e| e==""}
        params[:discipline_university][:discipline_ids]= Discipline.uniq.pluck(:id)
        (params[:discipline_university][:discipline_ids]).map! { |e| e.to_s  }
      else
        (params[:discipline_university][:discipline_ids]).delete("")
      end
      
      if params[:discipline_university][:cities_ids].all?{|e| e==""}
        params[:discipline_university][:cities_ids] = City.uniq.pluck(:id)
        (params[:discipline_university][:cities_ids]).map! { |e| e.to_s  }
      else
        (params[:discipline_university][:cities_ids]).delete("")
      end
      
      if params[:discipline_university][:university_ids].all?{|e| e==""}
        params[:discipline_university][:university_ids] = University.uniq.pluck(:id)
        (params[:discipline_university][:university_ids]).map! { |e| e.to_s  }
      else
        (params[:discipline_university][:university_ids]).delete("")
      end
      
      if params[:discipline_university][:subdiscipline_ids].all?{|e| e==""}
        params[:discipline_university][:subdiscipline_ids] = Subdiscipline.uniq.pluck(:id)
        (params[:discipline_university][:subdiscipline_ids]).map! { |e| e.to_s  }
      else
        (params[:discipline_university][:subdiscipline_ids]).delete("")
      end


      @discipline_universities = DisciplineUniversity.find_by_sql(["
          SELECT DISTINCT *
          FROM discipline_universities, universities
          WHERE 
            discipline_universities.university_id=universities.id 
            AND discipline_id IN (?) 
            AND university_id IN (?) 
            AND city_id IN (?)
            AND subdiscipline_id IN (?)",params[:discipline_university][:discipline_ids],params[:discipline_university][:university_ids],params[:discipline_university][:cities_ids],params[:discipline_university][:subdiscipline_ids]]) if params[:discipline_university].present?
      else
        @discipline_universities= DisciplineUniversity.all
    end
    respond_to do |format|
      format.html
      format.js
    end
    # puts @discipline_universities
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

  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["university_id","discipline_id","degreeprogram_id","subdiscipline_id","hec_recognized","tution_fee_per_semester","duration"]
      @degrees=DisciplineUniversity.all
      @degrees.each do |dp|
        sheet.add_row [University.find(dp.university_id).name,Degreeprogram.find(dp.degreeprogram_id).name,dp.hec_recognized,dp.tution_fee_per_semester,dp.duration]
      end
    end
    send_data package.to_stream.read, :filename => "DisciplineUniversities.xlsx"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline_university
      @discipline_university = DisciplineUniversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_university_params
      params.require(:discipline_university).permit(:university_id, :degreeprogram_id, :hec_recognized, :tution_fee_per_semester, :duration)
    end
end