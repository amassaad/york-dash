# require 'roo'
# require 'date'

# google_user = ENV['google_user']
# google_pass =   ENV['google_pass']

# workbook = Roo::Google.new("", user: google_user, password: google_password)

# workbook.default_sheet = workbook.sheets[0]

# data1 = workbook.cell(1, 1)

SCHEDULER.every "15m", first_in: 0 do |job|
  data = [
    { "x" => 1, "y" =>  1.07 },
    { "x" => 2, "y" =>  1.18 },
    { "x" => 3, "y" =>  1.42 },
    { "x" => 4, "y" =>  1.10 },
    { "x" => 5, "y" =>  1.33 },
    { "x" => 6, "y" =>  0.79 },
    { "x" => 7, "y" =>  1.22 },
    { "x" => 8, "y" =>  1.14 },
    { "x" => 9, "y" =>  1.18 },
    { "x" => 10, "y" => 1.23 },
    { "x" => 11, "y" => 1.75 },
    { "x" => 12, "y" => 2.51 },
    { "x" => 13, "y" => 3.20 },
    { "x" => 14, "y" => 2.02 },
    { "x" => 15, "y" => 1.61 },
    { "x" => 16, "y" => 1.20 },
    { "x" => 17, "y" => 1.02 },
    { "x" => 18, "y" => 1.28 },
    { "x" => 19, "y" => 1.23 },
    { "x" => 20, "y" => 1.22 },
    { "x" => 21, "y" => 1.74 },
    { "x" => 22, "y" => 2.91 },
    { "x" => 23, "y" => 5.04 },
    { "x" => 24, "y" => 2.33 },
    { "x" => 25, "y" => 2.06 },
    { "x" => 26, "y" => 1.71 },
    { "x" => 27, "y" => 1.51 },
    { "x" => 28, "y" => 1.48 }
  ]
  send_event(:kwh_value, points: data)
end

