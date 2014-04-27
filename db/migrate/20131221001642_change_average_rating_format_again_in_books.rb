class ChangeAverageRatingFormatAgainInBooks < ActiveRecord::Migration
  def up
  	change_column :books, :average_rating, :float
  end

  def down
  end
end
