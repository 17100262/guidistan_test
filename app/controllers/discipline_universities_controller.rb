class DisciplineUniversitiesController < ApplicationController
  before_action :set_discipline_university, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  autocomplete :university, :name

  load_and_authorize_resource :except => [:autocomplete_university_name]

  
  # GET /discipline_universities
  # GET /discipline_universities.json
  def index
    @discipline_universities= DisciplineUniversity.search(params[:discipline_id],params[:subdiscipline_id],params[:university_name],params[:city_id]).paginate(:page => params[:page],:per_page => 10)
  
    # @filterrific = initialize_filterrific(
    #   DisciplineUniversity,
    #   params[:filterrific]
    # ) or return

    # # puts params[:discipline_university] == nil,"check"

    # if params[:discipline_university].present?
    #   if params[:discipline_university][:discipline_ids].all?{|e| e==""}
    #     params[:discipline_university][:discipline_ids]= Discipline.uniq.pluck(:id)
    #     (params[:discipline_university][:discipline_ids]).map! { |e| e.to_s  }
    #   else
    #     (params[:discipline_university][:discipline_ids]).delete("")
    #   end
      
    #   if params[:discipline_university][:cities_ids].all?{|e| e==""}
    #     params[:discipline_university][:cities_ids] = City.uniq.pluck(:id)
    #     (params[:discipline_university][:cities_ids]).map! { |e| e.to_s  }
    #   else
    #     (params[:discipline_university][:cities_ids]).delete("")
    #   end
      
    #   if params[:discipline_university][:university_ids].all?{|e| e==""}
    #     params[:discipline_university][:university_ids] = University.uniq.pluck(:id)
    #     (params[:discipline_university][:university_ids]).map! { |e| e.to_s  }
    #   else
    #     (params[:discipline_university][:university_ids]).delete("")
    #   end
      
    #   if params[:discipline_university][:subdiscipline_ids].all?{|e| e==""}
    #     params[:discipline_university][:subdiscipline_ids] = Subdiscipline.uniq.pluck(:id)
    #     (params[:discipline_university][:subdiscipline_ids]).map! { |e| e.to_s  }
    #   else
    #     (params[:discipline_university][:subdiscipline_ids]).delete("")
    #   end


    #   @discipline_universities = DisciplineUniversity.find_by_sql(["
    #       SELECT DISTINCT *
    #       FROM universities u,discipline_universities d 
    #       WHERE 
    #         u.id = d.university_id 
    #         AND d.discipline_id IN (?) 
    #         AND d.university_id IN (?) 
    #         AND u.city_id IN (?)
    #         AND subdiscipline_id IN (?)",params[:discipline_university][:discipline_ids],params[:discipline_university][:university_ids],params[:discipline_university][:cities_ids],params[:discipline_university][:subdiscipline_ids]]) if params[:discipline_university].present?
    #   else
    #     @discipline_universities= DisciplineUniversity.search(params[:discipline_id],params[:subdiscipline_id]).paginate(:page => params[:page],:per_page => 10)
    #     # @discipline_universities= DisciplineUniversity.all
        
    # end
    
    respond_to do |format|
      format.html
      format.js
    end
    # puts 'hello world', @discipline_universities.map{|n| }
  end

  # GET /discipline_universities/1
  # GET /discipline_universities/1.json
  def show
    # puts params[:discipline][:id]
    if (current_user!=nil)
      ahoy.track "Clicked Degree", {title: @discipline_university.name,id:@discipline_university.id,discipline_name:@discipline_university.discipline.name,discipline_id:@discipline_university.discipline.id}
    end
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
    @discipline_university.discipline_id = Subdiscipline.find(@discipline_university.subdiscipline_id).discipline_id
    respond_to do |format|
      if @discipline_university.save
        format.html { redirect_to "/discipline_universities", notice: 'Discipline university was successfully created.' }
        format.json { render :show, status: :created, location: @discipline_university }
      else
        format.html { render :new }
        format.json { render json: @discipline_university.errors, status: :unprocessable_entity }
      end
    end
  end

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


  def destroy
    @discipline_university.destroy
    respond_to do |format|
      format.html { redirect_to discipline_universities_url, notice: 'Discipline university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def wishlist
    
    if (WishlistDegree.exists?(:user_id => current_user.id,:discipline_university_id =>  @discipline_university.id))
      WishlistDegree.where(:user_id => current_user.id,:discipline_university_id =>  @discipline_university.id).destroy_all
      redirect_to "/discipline_universities/#{@discipline_university.id}", notice: "Degree program removed from wishlist"
    else
      WishlistDegree.create(:user_id => current_user.id,:discipline_university_id =>  @discipline_university.id)
      redirect_to "/discipline_universities/#{@discipline_university.id}", notice: "Degree program added to wishlist"
    end
  end
  
  def import
    DisciplineUniversity.import(params[:file])
    redirect_to discipline_universities_path, notice: "Degree Programs of Universities imported"
  end
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["university_id","discipline_id","name","degree_type","subdiscipline_id","hec_recognized","tution_fee_per_semester","duration","criteria","link"]
      @degrees=DisciplineUniversity.all
      @degrees.each do |dp|
        sheet.add_row [University.find(dp.university_id).name,Discipline.find(dp.discipline_id).name,dp.name,dp.degree_type,Subdiscipline.find(dp.subdiscipline_id).name,dp.hec_recognized,dp.tution_fee_per_semester,dp.duration,dp.criteria,dp.link]
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
      params.require(:discipline_university).permit(:university_id, :discipline_id,:subdiscipline_id,:name,:degree_type, :hec_recognized, :tution_fee_per_semester, :duration,:criteria,:link)
    end
end