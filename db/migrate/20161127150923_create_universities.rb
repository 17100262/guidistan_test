class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.text :description
      t.integer :city_id
      t.string :campus
      t.string :link
      t.timestamps null: false
    end
  end
end
