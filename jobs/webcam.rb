require 'net/http'
require 'json'
require 'rubygems'
require 'mechanize'

@first_url = "http://traffic.ottawa.ca/map/"
#I am the local cam (St Patrick and Dalhousie)
@url1 = "http://traffic.ottawa.ca/map/camera?id=185"
#I am the War Museum cam (Booth and Sir John A. Macdonald Parkway)
@url2 = "http://traffic.ottawa.ca/map/camera?id=49"
#I am a camera near work
@url3 = "http://traffic.ottawa.ca/map/camera?id=35"
#I am the camera at Rideau and Sussex
@url4 = "http://traffic.ottawa.ca/map/camera?id=33"

@a = Mechanize.new 
#get cookie
@a.get(@first_url)

SCHEDULER.every '2s', first_in: 0 do |job|
  get_camera(@url1, 'cam1')
  get_camera(@url2, 'cam2')
  get_camera(@url3, 'cam3')
  get_camera(@url4, 'cam4')
end

def get_camera(url, cam)
  #get frame 0
  @a.get(url).save "public/#{cam}-tmp1.jpg"
  #send_event for saved tmp file
  send_img("#{cam}-tmp1.jpg", cam)
  sleep(15.0/30.0)
  File.delete("public/#{cam}-tmp1.jpg")

  #get frame 1
  #do something with it, save?
  @a.get(url).save "public/#{cam}-tmp2.jpg"
  #send_event for saved temp1 file
  send_img("#{cam}-tmp2.jpg", cam)
  sleep(15.0/30.0)
  File.delete("public/#{cam}-tmp2.jpg")
end

# SCHEDULER.every '15s', first_in: 0 do |job|
#   send_event('cam1', image: "background-image:url(#{file_jpg})")
#   sleep(1.0/30.0)
def send_img(filename, cam)
  send_event(cam, image: "background-image:url(#{filename})")
end



END { 
  File.delete("public/cam1-tmp1.jpg") if File.exist?("public/cam1-tmp1.jpg")
  File.delete("public/cam1-tmp2.jpg") if File.exist?("public/cam1-tmp2.jpg")

  File.delete("public/cam2-tmp1.jpg") if File.exist?("public/cam2-tmp1.jpg")
  File.delete("public/cam2-tmp2.jpg") if File.exist?("public/cam2-tmp2.jpg")

  File.delete("public/cam3-tmp1.jpg") if File.exist?("public/cam3-tmp1.jpg")
  File.delete("public/cam3-tmp2.jpg") if File.exist?("public/cam3-tmp2.jpg")

  File.delete("public/cam4-tmp1.jpg") if File.exist?("public/cam4-tmp1.jpg")
  File.delete("public/cam4-tmp2.jpg") if File.exist?("public/cam4-tmp2.jpg")
}


#   send_event('cam2', image: "background-image:url(#{@first_url})")
#   sleep(1.0/30.0)
#   send_event('cam3', image: "background-image:url(#{@first_url})")
#   sleep(1.0/30.0)
#   send_event('cam4', image: "background-image:url(#{@first_url})")
#   sleep(1.0/30.0)
#   send_event('cam1', image: "background-image:url(#{@url1})")
#   sleep(1.0/30.0)
#   send_event('cam2', image: "background-image:url(#{url2})")
#   sleep(1.0/30.0)
#   send_event('cam3', image: "background-image:url(#{url3})")
#   sleep(1.0/30.0)
#   send_event('cam4', image: "background-image:url(#{url4})")
#   sleep(1.0/2.0)
#   send_event('cam1', image: "background-image:url(#{@url1})")
#   sleep(1.0/2.0)
#   send_event('cam2', image: "background-image:url(#{url2})")
#   sleep(1.0/2.0)
#   send_event('cam3', image: "background-image:url(#{url3})")
#   sleep(1.0/2.0)
#   send_event('cam4', image: "background-image:url(#{url4})")
# end
