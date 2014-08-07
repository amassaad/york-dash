SCHEDULER.every '20s', :first_in => 0 do |job|
    url = "http://33.media.tumblr.com/c258355d21dc46c2eba7e17177a0157c/tumblr_n2v0753m531rudcwro1_500.gif"
    puts url
    send_event('iframe2', url: url)
end