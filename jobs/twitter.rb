require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = '7K3XrrL4zaoB53uqsPNU1fySI'
  config.consumer_secret = '1DsMjlbFNCmQbMjmIA5JLaZYWyiVftm6EoTdPP3uKPqingz9r0'
  config.access_token = '54641559-ww0IAKxdxfQOj6OGp3YGTwzREdQjrf33tQmLfNYzS'
  config.access_token_secret = 'FPCl1OEAM866wOcgz0odubxc0OyNhU3CNjy3BOYXo4typ'
end

search_term = URI::encode('#victoria007')

SCHEDULER.every '4m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end