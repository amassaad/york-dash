require 'net/http'
require 'json'

SCHEDULER.every '10s', first_in: 0 do |job|
  url = "http://media.gallery.ca/newcam.jpg"
  send_event('gallery', image: "background-image:url(#{url})")
end