class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.string :name
      t.string :level
      t.text :description
      t.string :category
      t.string :link
      t.text :procedure
      t.string :criteria
      t.string :lastdate
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
      t.timestamps null: false
    end
  end
end
