# require 'roo'
# require 'date'

# google_user = ENV['google_user']
# google_pass =   ENV['google_pass']

# workbook = Roo::Google.new("", user: google_user, password: google_password)

# workbook.default_sheet = workbook.sheets[0]

# data1 = workbook.cell(1, 1)

SCHEDULER.every "15m", first_in: 0 do |job|
  data = [
    { "x" => 1, "y" =>  0.35 },
    { "x" => 2, "y" =>  0.34 },
    { "x" => 3, "y" =>  0.64 },
    { "x" => 4, "y" =>  1.07 },
    { "x" => 5, "y" =>  1.05 },
    { "x" => 6, "y" =>  1.57 },
    { "x" => 7, "y" =>  1.22 },
    { "x" => 8, "y" =>  0.80 },
    { "x" => 9, "y" =>  1.77 },
    { "x" => 10, "y" => 1.11 },
    { "x" => 11, "y" => 0.97 },
    { "x" => 12, "y" => 0.98 },
    { "x" => 13, "y" => 1.20 },
    { "x" => 14, "y" => 0.99 },
    { "x" => 15, "y" => 1.19 },
    { "x" => 16, "y" => 0.93 },
    { "x" => 17, "y" => 1.67 },
    { "x" => 18, "y" => 1.56 },
    { "x" => 19, "y" => 1.27 },
    { "x" => 20, "y" => 1.31 },
    { "x" => 21, "y" => 1.11 },
    { "x" => 22, "y" => 1.24 },
    { "x" => 23, "y" => 0.91 },
    { "x" => 24, "y" => 1.07 },
    { "x" => 25, "y" => 1.18 },
    { "x" => 26, "y" => 1.42 },
    { "x" => 27, "y" => 1.10 },
    { "x" => 28, "y" => 1.33 }
  ]
  send_event(:kwh_value, points: data)
end

