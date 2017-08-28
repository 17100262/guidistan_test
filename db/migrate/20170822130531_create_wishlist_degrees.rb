class CreateWishlistDegrees < ActiveRecord::Migration
  def change
    create_table :wishlist_degrees do |t|
      t.integer :user_id
      t.integer :discipline_university_id
      t.timestamps null: false
    end
  end
end
