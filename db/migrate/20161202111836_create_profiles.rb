class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender, limit: 1
      t.string :city

      t.timestamps null: false
    end
  end
end
