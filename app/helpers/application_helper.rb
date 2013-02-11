module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Anand Sampat"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # load the blog feed

  def load_blog_feed
    feed = Feedzirra::Feed.fetch_and_parse("http://anandsampat.wordpress.com/feed");
    unless feed.is_a?(Fixnum)
      @feed_title = feed.title;
      @blog_posts = feed.entries[0...3]; nil
    else
      @blog_posts = []
    end
  end

end