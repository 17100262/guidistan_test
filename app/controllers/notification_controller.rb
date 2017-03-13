class NotificationController < ApplicationController
  def index
    # @activities = PublicActivity::Activity.all.order("created_at desc").select { |record| current_user.comments.where(commentable_type:"Post").pluck(:commentable_id).uniq.include?(record.trackable.post_id) && current_user.id!=record.owner.id && record.created_at > (current_user.comments.order("created_at asc").where(commentable_id:record.trackable.post_id).first.created_at) }
    # puts "here is the BS", @activities
    
    # user ki wo post jis par comment hua hai ya jis par usne comment kia hai
    
    #owner performs the action
    #activity.trackable gets the object jo track hua hai
    # @activities =PublicActivity::Activity.last
    @activities = PublicActivity::Activity.all.order("created_at desc").where(recipient_id:current_user).where.not(owner_id:current_user)
    # puts "current " ,current_user.profile.name
  end
end
# 
# 