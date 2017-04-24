class Profile < ActiveRecord::Base
    has_many :profile_education, dependent: :destroy
    has_many :education, :through => :profile_education, dependent: :destroy
    # has_attached_file :photo
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
    belongs_to :user
    is_impressionable
    has_many :disciplines, :through => :student_interests_discipline
    has_many :student_interests_discipline, dependent: :destroy
    belongs_to :city
    
    
end
