require 'httparty'
require 'json'

placeholder = '/assets/nyantocat.gif'

SCHEDULER.every '75s', first_in: 0 do |job|
  response = HTTParty.get('http://www.reddit.com/r/catsstandingup.json')
  json = JSON.parse(response.body)

  if json['data']['children'].count <= 0
    send_event('cats', image: placeholder)
  else
    urls = json['data']['children'].map{|child| child['data']['url'] }

    # Ensure we're linking directly to an image, not a gallery etc.
    valid_urls = urls.select{|url| url.downcase.end_with?('png', 'gif', 'jpg', 'jpeg')}
    send_event('cats', image: "background-image:url(#{valid_urls.sample(1).first})")
  end
end
