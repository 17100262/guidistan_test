class Post < ActiveRecord::Base
    belongs_to :forum
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
    is_impressionable
    acts_as_votable
    
end
