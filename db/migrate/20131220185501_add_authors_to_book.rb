class AddAuthorsToBook < ActiveRecord::Migration
  def change
    add_column :books, :authors, :array
  end
end
