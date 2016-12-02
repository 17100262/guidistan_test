class Profile < ActiveRecord::Base
    has_many :profile_education
    has_many :education, :through => :profile_education
    
end
