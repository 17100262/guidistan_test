class Post < ActiveRecord::Base
    belongs_to :forum
    belongs_to :user
    has_one :flagged_post
    has_many :comments, as: :commentable, dependent: :destroy
    is_impressionable
    acts_as_votable
    acts_as_taggable
    
end
