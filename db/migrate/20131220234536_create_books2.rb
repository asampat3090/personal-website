class CreateBooks2 < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string :title
      t.string :image_url
      t.string :link
      t.integer :num_pages
      t.integer :publication_day
      t.integer :publication_year
      t.integer :publication_month
      t.integer :average_rating
      t.text :description
      t.text :authors
      t.text :shelves

      t.timestamps
    end
  end
end