SCHEDULER.every '20s', :first_in => 0 do |job|
    url = ""
    puts url
    send_event('iframe2', url: url)
end