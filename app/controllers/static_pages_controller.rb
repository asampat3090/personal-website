class StaticPagesController < ApplicationController
  
  def home
  end

  def help
  end
  
  def about
  end

  def reading
    @articles = Article.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def book_reading
    @books_read = Book.order("average_rating DESC").paginate(:page => params[:page], :per_page => 5)
  end
  
  def contact
  end
end
