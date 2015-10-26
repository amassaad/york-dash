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
@a.get(@first_url)

log = Logger.new(STDOUT)
log.level = Logger::WARN
log.warn("I am starting the webcam script at #{Time.now}")

SCHEDULER.every '10s', first_in: "5s" do |job|
  get_camera(@url1, 'cam1')
  log.warn("I just asked for get_camera to start at #{Time.now}")
  get_camera(@url2, 'cam2')
  log.warn("I just asked for get_camera to start at #{Time.now}")
  get_camera(@url3, 'cam3')
  log.warn("I just asked for get_camera to start at #{Time.now}")
  get_camera(@url4, 'cam4')
  log.warn("I just asked for get_camera to start at #{Time.now}")
  log.warn("End run at #{Time.now}")
end

def get_camera(url, cam)
  Thread.new do
    @a.get(url).save! "public/#{cam}-tmp1.jpg"
    @a.get(url).save! "public/#{cam}-tmp2.jpg"
    sleep(1)
    send_img("#{cam}-tmp1.jpg", cam)
    sleep(4)
    send_img("#{cam}-tmp2.jpg", cam)
    File.delete("public/#{cam}-tmp1.jpg")
    sleep(2)
    File.delete("public/#{cam}-tmp2.jpg")
  end
end

def send_img(filename, cam)
  send_event(cam, image: "background-image:url(#{filename})")
end

END {
  FILE1a = "public/cam1-tmp1.jpg"
  FILE1b = "public/cam1-tmp2.jpg"
  FILE2a = "public/cam2-tmp1.jpg"
  FILE2b = "public/cam2-tmp2.jpg"
  FILE3a = "public/cam3-tmp1.jpg"
  FILE3b = "public/cam3-tmp2.jpg"
  FILE4a = "public/cam4-tmp1.jpg"
  FILE4b = "public/cam4-tmp2.jpg"

  File.delete(FILE1a) if File.exist?(FILE1a)
  File.delete(FILE1b) if File.exist?(FILE1b)

  File.delete(FILE2a) if File.exist?(FILE2a)
  File.delete(FILE2b) if File.exist?(FILE2b)

  File.delete(FILE3a) if File.exist?(FILE3a)
  File.delete(FILE3b) if File.exist?(FILE3b)

  File.delete(FILE4a) if File.exist?(FILE4a)
  File.delete(FILE4b) if File.exist?(FILE4b)
}
