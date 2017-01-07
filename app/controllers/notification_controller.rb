class NotificationController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all.order("created_at desc").select { |record| current_user.comments.pluck(:post_id).uniq.include?(record.trackable.post_id) && current_user.id!=record.owner.id && record.created_at > (current_user.comments.order("created_at asc").where(post_id:record.trackable.post_id).first.created_at) }
    puts "here is the BS", @activities
  end
end
# 
# 