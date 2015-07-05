require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'fileutils'
require "google_drive"

APPLICATION_NAME = 'Drive API Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "drive-quickstart.json")
SCOPE = [
  "https://www.googleapis.com/auth/drive",
  "https://www.googleapis.com/auth/userinfo.email",
  "https://www.googleapis.com/auth/userinfo.profile",
  "https://spreadsheets.google.com/feeds/"
]

# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization request via InstalledAppFlow.
# If authorization is required, the user's default browser will be launched
# to approve the request.
#
# @return [Signet::OAuth2::Client] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
  storage = Google::APIClient::Storage.new(file_store)
  auth = storage.authorize

  if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
    app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
    flow = Google::APIClient::InstalledAppFlow.new({
      :client_id => app_info.client_id,
      :client_secret => app_info.client_secret,
      :scope => SCOPE})
    auth = flow.authorize(storage)
    puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
  end
  auth
end

# Initialize the API
client = Google::APIClient.new(:application_name => APPLICATION_NAME)
client.authorization = authorize
drive_api = client.discovered_api('drive', 'v2')

puts "client auth: " + client.authorization.access_token
session = GoogleDrive.login_with_oauth(client.authorization.access_token)
ws = session.spreadsheet_by_key("1qbDaw3yry37BiYH9PNSUZT-LBkKRG348SNOV8_dFkPA").worksheets[0]

data = []
# Dumps all cells.
(1..28).each do |col|
    yval = ws[col, 1].to_f
    data << { :x => col, :y => yval }  
end

File.open("public/hydro.json","w") do |f|
  f.write(data.to_json)
end
