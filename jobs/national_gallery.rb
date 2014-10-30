require 'net/http'
require 'json'

SCHEDULER.every '30s', first_in: 0 do |job|

  url = "http://media.gallery.ca/newcam.jpg"
  # resp = Net::HTTP.get_response(URI.parse(url))
  # jurl = JSON.parse(url)

  send_event('gallery', image: "background-image:url(#{url})")
end

# SCHEDULER.every '60s', first_in: 0 do |job|
#   http = Net::HTTP.new('www.reddit.com')
#   response = http.request(Net::HTTP::Get.new("/r/cats/top.json"))
#   json = JSON.parse(response.body)

#   if json['data']['children'].count <= 0
#     send_event('aww', image: placeholder)
#   else
#     urls = json['data']['children'].map{|child| child['data']['url'] }

#     # Ensure we're linking directly to an image, not a gallery etc.
#     valid_urls = urls.select{|url| url.downcase.end_with?('png', 'gif', 'jpg', 'jpeg')}
#     send_event('aww', image: "background-image:url(#{valid_urls.sample(1).first})")
#   end
# end
