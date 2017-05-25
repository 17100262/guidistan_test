class AddFlagiToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :flagi, :bool
  end
end
