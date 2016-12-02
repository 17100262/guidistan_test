class Education < ActiveRecord::Base
    has_many :profile_education
    has_many :profile, :through => :profile_education
    
end
