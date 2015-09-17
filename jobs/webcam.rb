require 'net/http'
require 'json'

fake_url = "http://traffic.ottawa.ca"
#I am the local cam (St Patrick and Dalhousie)
url1 = "http://traffic.ottawa.ca/map/camera?id=185"
#I am the War Museum cam (Booth and Sir John A. Macdonald Parkway)
url2 = "http://traffic.ottawa.ca/map/camera?id=49"
#I am a camera near work
url3 = "http://traffic.ottawa.ca/map/camera?id=35"
#I am the camera at Rideau and Sussex
url4 = "http://traffic.ottawa.ca/map/camera?id=33"

SCHEDULER.every '45s', first_in: 0 do |job|
  #We need to trick the browser into loading an erronious fake URL first to create the low fps "video" effect.
  send_event('cam1', image: "background-image:url(#{fake_url})")
  sleep(1.0/30.0)
  send_event('cam2', image: "background-image:url(#{fake_url})")
  sleep(1.0/30.0)
  send_event('cam3', image: "background-image:url(#{fake_url})")
  sleep(1.0/30.0)
  send_event('cam4', image: "background-image:url(#{fake_url})")
  sleep(1.0/30.0)
  send_event('cam1', image: "background-image:url(#{url1})")
  sleep(1.0/30.0)
  send_event('cam2', image: "background-image:url(#{url2})")
  sleep(1.0/30.0)
  send_event('cam3', image: "background-image:url(#{url3})")
  sleep(1.0/30.0)
  send_event('cam4', image: "background-image:url(#{url4})")
  sleep(1.0/2.0)
  send_event('cam1', image: "background-image:url(#{url1})")
  sleep(1.0/2.0)
  send_event('cam2', image: "background-image:url(#{url2})")
  sleep(1.0/2.0)
  send_event('cam3', image: "background-image:url(#{url3})")
  sleep(1.0/2.0)
  send_event('cam4', image: "background-image:url(#{url4})")
end
