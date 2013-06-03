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
    Feedzirra::Feed.fetch_and_parse("http://getpocket.com/users/anand.sampat/feed/all").entries.each do |e|
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
end
