SCHEDULER.every '15s', first_in: 0 do |job|
    send_event('gallery', image: "background-image:url(http://media.gallery.ca/newcam.jpg)")
  end
end
