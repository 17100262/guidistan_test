class CreateProfileEducations < ActiveRecord::Migration
  def change
    create_table :profile_educations do |t|
      t.integer :profile_id
      t.integer :education_id

      t.timestamps null: false
    end
  end
end
