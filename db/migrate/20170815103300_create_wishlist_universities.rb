class CreateWishlistUniversities < ActiveRecord::Migration
  def change
    create_table :wishlist_universities do |t|
      t.integer :user_id
      t.integer :university_id
      t.timestamps null: false
    end
  end
end
