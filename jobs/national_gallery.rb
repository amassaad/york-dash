require 'net/http'
require 'json'

SCHEDULER.every '19s', first_in: 0 do |job|
  url = "http://media.gallery.ca/newcam.jpg"
  fake_url = "http://media.gallery.ca/newmac.jpg"
  send_event('gallery', image: "background-image:url(#{fake_url})")
  sleep(1.0/2.0)
  send_event('gallery', image: "background-image:url(#{url})")
  sleep(1.0/2.0)
  send_event('gallery', image: "background-image:url(#{url})")
      puts "#{Time.now.getlocal("-05:00")}"

end
