class University < ActiveRecord::Base

	has_many :discipline_university
	
	has_many :discipline, :through => :discipline_university
	has_many :subdiscipline, :through => :discipline_university
	has_many :degreeprogram,:through => :discipline_university

    belongs_to :city
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                uni = new
                uni.name = header[0]
                uni.campus = header[4]
                if University.exists?(name: uni.name,campus: uni.campus)
                    
                else
                	uni.description = header[1]
                	if City.exists?(name: header[2])
                	    uni.city_id = City.find_by(name: header[2]).id
                    else
                        City.create(name: header[2])
                        uni.city_id = City.find_by(name: header[2]).id
                    end
                    uni.link = header[3]
                    uni.number = header[5]
                    uni.email = header[6]
                    uni.facebook = header[7]
                    uni.address = header[8]
                    uni.image = header[9]
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
