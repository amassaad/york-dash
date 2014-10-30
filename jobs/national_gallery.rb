require 'net/http'
require 'json'

SCHEDULER.every '28s', first_in: 0 do |job|
  url = "http://media.gallery.ca/newcam.jpg"
  fake_url = "http://media.gallery.ca/newmac.jpg"
  send_event('gallery', image: "background-image:url(#{fake_url})")
  sleep(1)
  send_event('gallery', image: "background-image:url(#{url})")
end