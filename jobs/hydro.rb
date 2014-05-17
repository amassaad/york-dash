# jobs/market.rb
SCHEDULER.every "10s", first_in: 0 do |job|
  data = [
    { "x" => 1, "y" => 10 },
    { "x" => 2, "y" => 20 },
    { "x" => 3, "y" => 55 },
    { "x" => 4, "y" => 55 },
    { "x" => 5, "y" => 65 },
    { "x" => 6, "y" => 95 },
    { "x" => 7, "y" => 45 },
    { "x" => 8, "y" => 65 },
    { "x" => 9, "y" => 67 },
    { "x" => 10, "y" => 70 }
  ]
  send_event(:kwh_value, points: data)
end