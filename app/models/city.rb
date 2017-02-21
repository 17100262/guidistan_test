class City < ActiveRecord::Base
    validates :name, :uniqueness => {:message => 'already taken'}
    has_many :university
    
end
