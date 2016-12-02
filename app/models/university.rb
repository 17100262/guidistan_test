class University < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}
	
	has_many :discipline_university
	
	has_many :discipline, :through => :discipline_university
	has_many :subdiscipline, :through => :discipline_university
	has_many :degreeprogram,:through => :discipline_university


    belongs_to :city
end
