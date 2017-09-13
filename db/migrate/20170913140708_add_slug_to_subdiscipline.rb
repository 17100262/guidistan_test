class AddSlugToSubdiscipline < ActiveRecord::Migration
  def change
    add_column :subdisciplines, :slug, :string
    add_index :subdisciplines, :slug, unique: true
  end
end
