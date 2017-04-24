class AddFieldToProfileUniversity < ActiveRecord::Migration
  def change
    remove_column :profiles, :city, :string
    add_column :profiles, :city_id, :integer
    add_column :universities, :student_type, :string
  end
end
