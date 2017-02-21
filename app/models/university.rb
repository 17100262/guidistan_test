class University < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}
	
	has_many :discipline_university
	
	has_many :discipline, :through => :discipline_university
	has_many :subdiscipline, :through => :discipline_university
	has_many :degreeprogram,:through => :discipline_university


    belongs_to :city

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                uni = new
                uni.name = header[0]
                if University.exists?(name: uni.name)
                else
                	uni.description = header[1]
                	uni.city_id = City.find_by(name: header[2]).id
                    uni.save!
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
