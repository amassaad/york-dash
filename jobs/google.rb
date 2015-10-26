@hydro = File.open("public/hydro.json").read

SCHEDULER.every "90m", first_in: "5s" do |job|
  send_event(:kwh_value, points: @hydro)
end
