class CreateSubdisciplines < ActiveRecord::Migration
  def change
    create_table :subdisciplines do |t|
      t.string :name
      t.integer :discipline_id
      t.text :description

      t.timestamps null: false
    end
  end
end
