class Post < ActiveRecord::Base
    belongs_to :discipline
    belongs_to :user
    has_many :comments
    is_impressionable
    acts_as_votable
end
