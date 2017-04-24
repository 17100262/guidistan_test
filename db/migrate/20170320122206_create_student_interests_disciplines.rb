class CreateStudentInterestsDisciplines < ActiveRecord::Migration
  def change
    create_table :student_interests_disciplines do |t|
      t.integer :profile_id
      t.integer :discipline_id

      t.timestamps null: false
    end
  end
end
