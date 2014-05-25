require 'octranspo_fetch'
 
APPLICATION_ID = ENV['OC_ID']
APPLICATION_KEY = ENV['OC_KEY']
MAX_RESULTS = 11
STOPS = {
    "3009" => {description: "Rideau Street", buses: [1,95,97]},
    "3000" => {description: "Rideau Center (bridge)", buses: [8, 95, 97]}
}
 
 
oct = OCTranspo.new({application_id: APPLICATION_ID, application_key: APPLICATION_KEY})
 
SCHEDULER.every '2m', :first_in => 0 do
    # Get data for each stop
    no_data = []
    trips = []
    STOPS.each do |stop_no, stop_info|
        route_nos = stop_info[:buses]
        trips_for_stop = oct.simple_get_next_trips_for_stop stop_no, route_nos
        if trips_for_stop.length == 0
            no_data.push (stop_info[:description] or stop_no)
        else
            trips_for_stop.each do |trip|
                if stop_info[:description]
                    trip[:stop_description] = stop_info[:description]
                end
            end
            trips.concat trips_for_stop
        end
    end
 
    # Sort everything by arrival time.
    trips.sort! { |a,b| a[:arrival_in_minutes] <=> b[:arrival_in_minutes] }
 
    # Limit number of trips we return
    trips = trips[0...MAX_RESULTS]
 
    moreinfo = if no_data.length > 0
        "No data for stops: #{no_data.join ", "}"
    else
        cache_stats = oct.cache_stats()
        "Cache: #{cache_stats[:hits]} hits, #{cache_stats[:misses]} misses"
    end
 
    send_event('octranspo', { trips: trips, moreinfo: moreinfo})
end