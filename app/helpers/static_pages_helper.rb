module StaticPagesHelper
  # blog page helper functions
  def load_blog_feed
    feed = Feedzirra::Feed.fetch_and_parse("http://anandsampat.wordpress.com/feed");
    unless feed.is_a?(Fixnum)
      @feed_title = feed.title;
      @blog_posts = feed.entries[0...3]; nil
    else
      @blog_posts = []
    end
  end
  
  # reading page helper functions
  def load_reading_feed
    # add this to database if it doesn't exist in the database already 
    Feedzirra::Feed.fetch_and_parse("http://getpocket.com/users/anand.sampat/feed/read").entries.each do |e|
      # only add an item if the unique title is not already in the databse (assuming no article has the same title-I hope :-)
      if !Article.exists?(url: e.url)
        temp2=Article.create(url: e.url)
        temp2.created_at = e.published
        temp2.save
        # add in the categories
        for cat in e.categories
          temp2.categories.create(name: cat)
        end
      end
    end
  end

  # book reading page helper function
  def load_book_feed
    # Use the Goodreads API to access my personal public profile
    # key: xIgnxTVcHqymrVEy1Nmcg
    # secret: 8N6IxNhOFAyPJHEQkc7QJIMj9qCIo1DVIxknWFIE
    require 'open-uri'
    # Get all of the read books from Goodreads
    xml_feed = Nokogiri::XML(open("https://www.goodreads.com/review/list?format=xml&v=2&key=xIgnxTVcHqymrVEy1Nmcg&id=25848331&shelf=read"))
    book_reviews = xml_feed.xpath("//reviews/review")
    # Loop through each of the book reviews 
    book_reviews.each do |review|
      isbn = review.xpath("book/isbn").text.to_i
      title = review.xpath("book/title").text
      image_url = review.xpath("book/image_url").text
      link = review.xpath("book/link").text
      num_pages = review.xpath("book/num_pages").text.to_i
      publication_day = review.xpath("book/publication_day").text.to_i
      publication_year = review.xpath("book/publication_year").text.to_i
      publication_month = review.xpath("book/publication_month").text.to_i
      average_rating = review.xpath("book/average_rating").text.to_f
      description = review.xpath("book/description").text
      description = Nokogiri::HTML(description).text
      authors = [review.xpath("book/authors").children.map{|author_arr| author_arr.children.map{|attr| attr.text}}[3]]
      shelves = ["read"]
      # Add this book to the database
      if !Book.exists?(isbn: isbn)
        Book.create(isbn:isbn,title:title,image_url:image_url,link:link,num_pages:num_pages,publication_day:publication_day,publication_year:publication_year,publication_month:publication_month,average_rating:average_rating,description:description,authors:authors,shelves:shelves)
      end      
    end  
  end
end
