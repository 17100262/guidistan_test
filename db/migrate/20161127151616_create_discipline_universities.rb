class CreateDisciplineUniversities < ActiveRecord::Migration
  def change
    create_table :discipline_universities do |t|
      t.integer :university_id
      t.string :degree_type
      t.string :name
      t.integer :subdiscipline_id
      t.integer :discipline_id
      t.integer :tution_fee_per_semester
      t.boolean :hec_recognized
      t.string :duration
      t.timestamps null: false
    end
  end
end
