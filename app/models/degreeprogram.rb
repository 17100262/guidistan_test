class Degreeprogram < ActiveRecord::Base
    belongs_to :discipline
	belongs_to :subdiscipline
	# has_many :university_degree
	has_many :discipline_university
	has_many :university, :through => :discipline_university
# validates_uniqueness_of :name, scope: [:degree_type, :subdiscipline_id,:discipline_id]
end
