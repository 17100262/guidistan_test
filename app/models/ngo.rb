class Ngo < ActiveRecord::Base
    
    def self.search(leveli)
        if leveli
            where(level: leveli)
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
                ngo = new
                ngo.name = header[0]
                
                
                if Ngo.exists?(name: ngo.name)
                    
                else
                	ngo.level = header[1]
                    ngo.description = header[2]
                    ngo.category = header[3]
                    ngo.procedure = header[4]
                    ngo.criteria = header[5]
                    ngo.link = header[6]
                    ngo.lastdate = header [7]
                    ngo.save!
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
