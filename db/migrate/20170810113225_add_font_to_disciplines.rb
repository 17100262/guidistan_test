class AddFontToDisciplines < ActiveRecord::Migration
  def change
    add_column :disciplines, :font, :string
  end
end
