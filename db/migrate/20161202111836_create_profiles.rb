class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :user_id
      t.string :gender
      t.integer :city_id
      t.integer :reputation, default: 0
      t.timestamps null: false
    end
  end
end
