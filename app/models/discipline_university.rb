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
