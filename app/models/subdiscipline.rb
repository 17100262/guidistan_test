class Subdiscipline < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}
    belongs_to :discipline
    # has_many :degreeprogram
    has_many :univeristy,:through => :discipline_university
    has_many :degreeprogram
end
