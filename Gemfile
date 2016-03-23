source 'https://rubygems.org'
ruby '2.3.0'

gem 'dashing',                    '1.3.4'
gem 'fitgem',                     '0.10.0'
gem 'haml',                       '4.0.5'
gem "sass", :require => 'sass'
gem 'octranspo_fetch',            '0.0.4'


gem 'httparty'
gem 'mechanize'
gem 'minty', :github => "amassaad/minty"

group :production do
	gem 'newrelic_rpm',             '3.9.6.257'
end

group :development, :test do
  gem 'rspec-rails',     '~> 3.1.0'
  # gem 'webrat',          '~> 0.7.3'
  gem 'rack'
  gem 'rack-test',       '~> 0.6.2'
  gem 'timecop',         '~> 0.7.1'
end

group :development do
  gem 'google_drive',               '1.0.1'
  gem 'google-api-client',          '0.8.6'
  gem 'omniauth-google-oauth2'
end
