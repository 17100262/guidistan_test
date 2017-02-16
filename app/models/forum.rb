class Forum < ActiveRecord::Base
    has_many :posts ,dependent: :destroy
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

end
