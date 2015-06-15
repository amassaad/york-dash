# require 'roo'
# require 'date'

# google_user = ENV['google_user']
# google_pass =   ENV['google_pass']

# workbook = Roo::Google.new("", user: google_user, password: google_password)

# workbook.default_sheet = workbook.sheets[0]

# data1 = workbook.cell(1, 1)

SCHEDULER.every "15m", first_in: 0 do |job|
  data = [
    { "x" => 1, "y" =>  2.91 },
    { "x" => 2, "y" =>  5.04 },
    { "x" => 3, "y" =>  2.33 },
    { "x" => 4, "y" =>  2.06 },
    { "x" => 5, "y" =>  1.71 },
    { "x" => 6, "y" =>  1.51 },
    { "x" => 7, "y" =>  1.48 },
    { "x" => 8, "y" =>  1.90 },
    { "x" => 9, "y" =>  4.94 },
    { "x" => 10, "y" => 5.96 },
    { "x" => 11, "y" => 4.36 },
    { "x" => 12, "y" => 5.31 },
    { "x" => 13, "y" => 3.93 },
    { "x" => 14, "y" => 1.86 },
    { "x" => 15, "y" => 2.30 },
    { "x" => 16, "y" => 1.94 },
    { "x" => 17, "y" => 2.52 },
    { "x" => 18, "y" => 2.95 },
    { "x" => 19, "y" => 4.72 },
    { "x" => 20, "y" => 1.93 },
    { "x" => 21, "y" => 1.58 },
    { "x" => 22, "y" => 3.36 },
    { "x" => 23, "y" => 3.25 },
    { "x" => 24, "y" => 4.15 },
    { "x" => 25, "y" => 4.16 },
    { "x" => 26, "y" => 4.31 },
    { "x" => 27, "y" => 3.99 },
    { "x" => 28, "y" => 3.38 }
  ]
  send_event(:kwh_value, points: data)
end

