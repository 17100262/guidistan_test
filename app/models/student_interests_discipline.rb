class StudentInterestsDiscipline < ActiveRecord::Base
    belongs_to :profile
    belongs_to :discipline
    # validates :discipline_id, uniqueness: { scope: [:profile_id] }
end
