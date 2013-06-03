class RemoveTitleFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :title
  end

  def down
    add_column :articles, :title, :string
  end
end
