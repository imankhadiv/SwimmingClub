source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'haml-rails'

gem 'devise'

gem 'html2haml'

gem 'rake', '~> 10.3.2'


# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer'

gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'simple_captcha2', require: 'simple_captcha'

gem "watu_table_builder", :require => "table_builder"
gem 'event-calendar', :require => 'event_calendar'
gem 'bootstrap-datepicker-rails'

gem 'bootstrap-sass', :github => 'thomas-mcdonald/bootstrap-sass'      # Twitter bootstrap in sass form
gem 'font-awesome-rails','~> 3.2.1'  # Bootstrap's icons rendered as a font
gem 'bootstrap_form'
gem 'jquery-ui-rails'

gem 'simple_form'

# gem 'rails_12factor'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'webshims-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', :group => :doc

gem "cancan"

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
group :test , :development do
  # gem 'capybara'
  gem 'selenium-webdriver'
  gem 'launchy'             # Used for save_and_open_page
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'    # The use of 'shoulda' and 'shoulda-context' will break testing in Ruby 1.9.3, so 'shoulda-matchers' instead

  gem 'simplecov','~> 0.8.2'           # Code test coverage
                                       #gem 'capybara-bootstrap-datepicker'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

end

group :production do
  ruby '2.0.0'

end


group :development, :test do
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'debugger'
  gem 'pry-rails'
end
gem 'rails_12factor', group: :production

#gem 'unicorn'
#gem 'webshims-rails'
gem 'rack-cache'
gem 'nokogiri', '~> 1.6.1'

gem "chartkick"

gem 'sprockets-rails', :require => 'sprockets/railtie'

gem "chromedriver-helper"


# gem 'mysql2', '< 0.3'


