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
                
                if DisciplineUniversity.exists?(university_id: University.find_by!(name: header[0]).id,name: header[3])
                else
                	degree.university_id = University.find_by(name: header[0]).id
                	degree.discipline_id = Discipline.find_by(name: header[1]).id
                	degree.subdiscipline_id = Subdiscipline.find_by(name: header[2]).id
                	degree.name = header[3]
                	degree.degree_type = header[4]
                	degree.hec_recognized = header[5]
                	degree.tution_fee_per_semester = header[6].to_i
                	degree.duration = header[7].to_i
                	degree.criteria = header[8]
                	degree.link = header[9]
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
