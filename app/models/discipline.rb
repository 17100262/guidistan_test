class Discipline < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}

	has_many :discipline_university
	has_many :university, :through => :discipline_university
	has_many :subdisciplines, :through => :subdisciplines 
    has_many :posts
    
    has_many :student_interests_discipline,dependent: :destroy
    has_many :profiles, :through => :student_interests_discipline
    
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                discipline = new
                discipline.name = header[0]
                discipline.description = header[1]
                discipline.font = header[2]
                if Discipline.exists?(name: discipline.name)
                else
                    discipline.save!
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
