class Profile < ActiveRecord::Base
    has_many :profile_education, dependent: :destroy
    has_many :education, :through => :profile_education, dependent: :destroy
    # has_attached_file :photo
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
    belongs_to :user
end
