require 'net/http'
require 'json'

first_url = "http://traffic.ottawa.ca/map/"
#I am the local cam (St Patrick and Dalhousie)
url1 = "http://traffic.ottawa.ca/map/camera?id=185"
#I am the War Museum cam (Booth and Sir John A. Macdonald Parkway)
url2 = "http://traffic.ottawa.ca/map/camera?id=49"
#I am a camera near work
url3 = "http://traffic.ottawa.ca/map/camera?id=35"
#I am the camera at Rideau and Sussex
url4 = "http://traffic.ottawa.ca/map/camera?id=33"


require 'rubygems'
require 'mechanize'

a = Mechanize.new 

a.get(first_url)
a.get(url1).save "public/tmp1.jpg"

send_event('cam2', image: "background-image:url('tmp1.jpg)")

#get cookie

#get frame 0
#do something with it, save?
#send_event for saved tmp file

#get frame 1
#do something with it, save?
#send_event for saved temp1 file

SCHEDULER.every '15s', first_in: 0 do |job|
  send_event('cam1', image: "background-image:url(#{first_url})")
  sleep(1.0/30.0)
  send_event('cam2', image: "background-image:url(#{first_url})")
  sleep(1.0/30.0)
  send_event('cam3', image: "background-image:url(#{first_url})")
  sleep(1.0/30.0)
  send_event('cam4', image: "background-image:url(#{first_url})")
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
