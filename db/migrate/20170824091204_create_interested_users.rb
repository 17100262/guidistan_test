class CreateInterestedUsers < ActiveRecord::Migration
  def change
    create_table :interested_users do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :universities
      t.string :address
      t.timestamps null: false
    end
  end
end
