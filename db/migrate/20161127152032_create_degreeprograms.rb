class CreateDegreeprograms < ActiveRecord::Migration
  def change
    create_table :degreeprograms do |t|
      t.string :degree_type
      t.string :name
      t.integer :subdiscipline_id
      t.integer :discipline_id

      t.timestamps null: false
    end
  end
end
