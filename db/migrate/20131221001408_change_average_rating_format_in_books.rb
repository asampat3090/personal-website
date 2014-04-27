class ChangeAverageRatingFormatInBooks < ActiveRecord::Migration
  def up
  	change_column :books, :average_rating, :decimal
  end

  def down
  end
end
