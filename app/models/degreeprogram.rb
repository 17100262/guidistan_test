class Degreeprogram < ActiveRecord::Base
	require 'roo'
    belongs_to :discipline
	belongs_to :subdiscipline
	# has_many :university_degree
	has_many :discipline_university
	has_many :university, :through => :discipline_university
# validates_uniqueness_of :name, scope: [:degree_type, :subdiscipline_id,:discipline_id]
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                degree = new
                degree.degree_type = header[0]
                degree.name = header[1]
                if Degreeprogram.exists?(name: degree.name)
                else
                	degree.subdiscipline_id = Subdiscipline.find_by(name: header[2]).id
                	degree.discipline_id = Discipline.find_by(name: header[3]).id
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
