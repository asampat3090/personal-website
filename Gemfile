source 'https://rubygems.org'

gem 'rails'
ruby "1.9.3"
gem 'bootstrap-sass', '2.1'
gem 'feedzirra'
gem 'embedly'
gem 'rubyzip'
gem 'activeresource'

gem 'actionmailer', '~>0.6.1'

# handle https connections
gem 'mechanize'

# pagination
gem 'will_paginate', '~> 3.0'

# add google analytics to website
gem 'google-analytics-rails'

# add meta tags for SEO to website
gem 'meta-tags', :require => 'meta_tags'

# check performance with newrelic
gem 'newrelic_rpm'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
end

group :development do
  gem 'annotate', '2.5.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'
end

group :production do
  gem 'pg', '0.12.2'
end
