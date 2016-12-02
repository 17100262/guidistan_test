class DisciplineUniversity < ActiveRecord::Base
    belongs_to :university
	belongs_to :discipline
	belongs_to :subdiscipline
    belongs_to :degreeprogram, foreign_key: "degreeprogram_id"
end
