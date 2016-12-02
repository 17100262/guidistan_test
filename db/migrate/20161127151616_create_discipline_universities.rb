class CreateDisciplineUniversities < ActiveRecord::Migration
  def change
    create_table :discipline_universities do |t|
      t.integer :university_id
      t.integer :discipline_id
      t.integer :degreeprogram_id
      t.integer :subdiscipline_id

      t.timestamps null: false
    end
  end
end
