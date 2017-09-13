class AddSlugToDisciplineUniversity < ActiveRecord::Migration
  def change
    add_column :discipline_universities, :slug, :string
    add_index :discipline_universities, :slug, unique: true
  end
end
