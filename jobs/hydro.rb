# require "google/api_client"
# require "google_drive"

# # Authorizes with OAuth and gets an access token.
# client = Google::APIClient.new
# auth = client.authorization
# auth.client_id = 
# auth.client_secret = 
# auth.scope = [
#   "https://www.googleapis.com/auth/drive",
#   "https://spreadsheets.google.com/feeds/"
# ]
# auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
# print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
# print("2. Enter the authorization code shown in the page: ")
# auth.code = $stdin.gets.chomp
# auth.fetch_access_token!
# access_token = auth.access_token
# p access_token
# sleep 5000


# session = GoogleDrive.login_with_oauth(at)

# # First worksheet of
# # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# ws = session.spreadsheet_by_key("1qbDaw3yry37BiYH9PNSUZT-LBkKRG348SNOV8_dFkPA").worksheets[0]

# # puts ws
# # # Changes content of cells.
# # # Changes are not sent to the server until you call ws.save().
# # ws[2, 1] = "foo"
# # ws[2, 2] = "bar"
# # ws.save
# data = []
# # Dumps all cells.
# (1..28).each do |col|
#     yval = ws[col, 1].to_f
#     data << { :x => col, :y => yval }  
# end

# puts data.to_json


# SCHEDULER.every "15m", first_in: "5s" do |job|
# #   data = [
# #     { "x" => 1, "y" =>  2.91 },
# #     { "x" => 2, "y" =>  5.04 },
# #     { "x" => 3, "y" =>  2.33 },
# #     { "x" => 4, "y" =>  2.06 },
# #     { "x" => 5, "y" =>  1.71 },
# #     { "x" => 6, "y" =>  1.51 },
# #     { "x" => 7, "y" =>  1.48 },
# #     { "x" => 8, "y" =>  1.90 },
# #     { "x" => 9, "y" =>  4.94 },
# #     { "x" => 10, "y" => 5.96 },
# #     { "x" => 11, "y" => 4.36 },
# #     { "x" => 12, "y" => 5.31 },
# #     { "x" => 13, "y" => 3.93 },
# #     { "x" => 14, "y" => 1.86 },
# #     { "x" => 15, "y" => 2.30 },
# #     { "x" => 16, "y" => 1.94 },
# #     { "x" => 17, "y" => 2.52 },
# #     { "x" => 18, "y" => 2.95 },
# #     { "x" => 19, "y" => 4.72 },
# #     { "x" => 20, "y" => 1.93 },
# #     { "x" => 21, "y" => 1.58 },
# #     { "x" => 22, "y" => 3.36 },
# #     { "x" => 23, "y" => 3.25 },
# #     { "x" => 24, "y" => 4.15 },
# #     { "x" => 25, "y" => 4.16 },
# #     { "x" => 26, "y" => 4.31 },
# #     { "x" => 27, "y" => 3.99 },
# #     { "x" => 28, "y" => 3.38 }
# #   ]
#   send_event(:kwh_value, points: data.to_json)
# end

