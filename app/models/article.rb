class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  attr_accessible :author, :content, :summary, :title, :url, :timestamps
end
