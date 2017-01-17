class Discipline < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}

	has_many :discipline_university
	has_many :university, :through => :discipline_university
	has_many :subdisciplines, :through => :subdisciplines 
	# foreign_key: "id"
    has_many :degreeprogram, :through => :discipline_university
    has_many :posts
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
