class Discipline < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}

	has_many :discipline_university
	has_many :university, :through => :discipline_university
	has_many :subdisciplines, :through => :subdisciplines 
	# foreign_key: "id"
    has_many :degreeprogram, :through => :discipline_university
end
