class Book < ActiveRecord::Base
  attr_accessible :average_rating, :description, :image_url, :isbn, :link, :num_pages, :publication_day, :publication_month, :publication_year, :title,:authors,:shelves
end
