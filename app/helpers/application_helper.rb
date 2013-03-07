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

  def load_reading_feed num1, num2
    rfeed = Feedzirra::Feed.fetch_and_parse("http://getpocket.com/users/anand.sampat/feed/all");
    unless rfeed.is_a?(Fixnum)
      @rfeed_title = rfeed.title.sanitize;
      @articles = rfeed.entries[num1, num2]; nil
    else
      @articles = []
    end
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

end