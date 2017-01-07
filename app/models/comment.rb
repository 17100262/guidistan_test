class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  include PublicActivity::Common


end
