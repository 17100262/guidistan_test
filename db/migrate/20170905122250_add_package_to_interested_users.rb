class AddPackageToInterestedUsers < ActiveRecord::Migration
  def change
    add_column :interested_users, :package, :bool
  end
end
