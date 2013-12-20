class AddShelvesToBook < ActiveRecord::Migration
  def change
    add_column :books, :shelves, :array
  end
end
