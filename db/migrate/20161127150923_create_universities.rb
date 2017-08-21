class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.text :description
      t.integer :city_id
      t.string :campus
      t.string :link
      t.string :number
      t.string :email
      t.string :address
      t.string :facebook
      t.timestamps null: false
    end
  end
end
