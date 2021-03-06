module ApplicationHelper

  # Setup the meta tags for better SEO on website
  def setup_meta_tags_params()
    set_meta_tags :title=> 'Anand Sampat',
                  :description => "Hi! I'm Anand and I dream about efficiency. Building and creating is just as important to me as learning. My ultimate dream is to create the perfect music creation app.",
                  :keywords => %w[ruby rails anand sampat engineer software hardware berkeley stanford ],
                  :canonical => "http://www.anandsampat.com",
                  :og => {
                    :title    => 'Anand Sampat',
                    :type     => 'article',
                    :url      => 'http://www.anandsampat.com',
                    :image    => 'http://oi44.tinypic.com/w2cbiq.jpg',
                    :description => "Hi! I'm Anand and I dream about efficiency. Building and creating is just as important to me as learning. My ultimate dream is to create the perfect music creation app.",
                    :site_name => 'Anand Sampat'
                    #:video    => {
                    #  :director => 'http://www.imdb.com/name/nm0000881/',
                    #  :writer   => ['http://www.imdb.com/name/nm0918711/', 'http://www.imdb.com/name/nm0177018/']
                    #}
                  }
  end
  
  # Setup open graph tags for website
  
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Anand Sampat"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

end