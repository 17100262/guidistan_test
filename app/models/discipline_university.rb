class DisciplineUniversity < ActiveRecord::Base
    belongs_to :university
	belongs_to :discipline
	belongs_to :subdiscipline
    # belongs_to :degreeprogram, foreign_key: "degreeprogram_id"
    
    
    filterrific(
	  default_filter_params: { sorted_by: 'created_at_desc'},
	  available_filters: [
	  	:sorted_by,
	  	:search_query,
	    :with_university_id,
	    :with_discipline_id
	  ]
	)
	
	scope :with_university_id, lambda { |university_id|
    	where(university_id: [*university_ids])
  	}
  	scope :by_uni_id,-> ids {where(university_id: ids) if ids.present? }
  	scope :by_discipline_id,-> ids {where(discipline_id: ids) if ids.present? }
  	
  	def self.search(discp_param,subdiscp_param,uniname,city_param)
        # puts discp_param=="",subdiscp_param=="",city_param=="",uniname=="","check here"
        if !discp_param.nil? and discp_param != ""
        #   puts !discp_param.nil?,discp_param,"hello world search_query",discp_param==""
            if !uniname.nil? and uniname != ""
                unid = University.find_by(name: uniname)
                where(discipline_id: discp_param,subdiscipline_id: subdiscp_param,university_id: unid)
            elsif subdiscp_param == ""
                where(discipline_id: discp_param)
            else
                where(discipline_id: discp_param,subdiscipline_id: subdiscp_param)
            end
        elsif !subdiscp_param.nil? and subdiscp_param != ""
            where(subdiscipline_id: subdiscp_param)
        elsif !city_param.nil? and city_param != ""
            unis = University.where(city_id: city_param)
            if uniname != "" and !discp_param.nil? and discp_param != ""
                where(university_id: uniname,discipline_id: discp_param,subdiscipline_id: subdiscp_param)
            elsif  !uniname.nil? and uniname != "" and discp_param == ""
                unid = University.find_by(name: uniname).id
                where(university_id: unid)
            else
               where(university_id: unis) 
            end

        #     find_by_sql(["
        #       SELECT DISTINCT *
        #   FROM universities u,discipline_universities d 
        #   WHERE 
        #      u.id = d.university_id
        #      AND u.city_id IN (?)",city_params]).take
        elsif !uniname.nil? and uniname != ""
            unid = University.find_by(name: uniname).id
            where(university_id: unid)
        else
            all
        end
    end
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                degree = new
                
                if DisciplineUniversity.exists?(university_id: University.find_by!(name: header[0],campus: header[2]).id,name: header[4])
                else
                	degree.university_id = University.find_by(name: header[0],campus: header[2]).id
                	degree.discipline_id = Discipline.find_by(name: header[3]).id
                	degree.subdiscipline_id = Subdiscipline.find_by(name: header[4]).id
                	degree.name = header[5]
                	degree.degree_type = header[6]
                	if header[7] == "Yes" or header[7] == "YES" or header[7] == 'yes'
                	    degree.hec_recognized = true
                	else
                	    degree.hec_recognized = true
                	end
                	degree.tution_fee_per_semester = header[8].to_i
                	degree.duration = header[9].to_i
                	degree.criteria = header[10]
                	degree.link = header[11]
                    degree.save!
                end
            end
        end
    end
    
    def self.open_spreadsheet(file)
        if file
            case File.extname(file.original_filename)
            when ".csv" then Csv.new(file.path, nil, :ignore)
            when ".xls" then Excel.new(file.path, nil, :ignore)
            when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
            else raise "Unknown file type: #{file.original_filename}"
            end
        end
    end
end
