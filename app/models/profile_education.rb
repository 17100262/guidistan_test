class ProfileEducation < ActiveRecord::Base
    belongs_to :profile
	belongs_to :education
end
