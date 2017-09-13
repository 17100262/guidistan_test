class Subdiscipline < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}
    extend FriendlyId
    friendly_id :name, use: :slugged
	
    belongs_to :discipline
    has_many :univeristy,:through => :discipline_university
    has_many :discipline_university
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                subdp = new
                subdp.name = header[0]
                if Subdiscipline.exists?(name: subdp.name)
                else
                	subdp.discipline_id = Discipline.find_by(name: header[1]).id
                	subdp.description = header[2]
                    subdp.save!
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
