require 'minty'
require 'text-table'
require 'minty/utils'

@creds = Minty::Credentials.load

t = Minty::Client.new(@creds)

def dollars(value)
  dollars, right = value.to_f.to_s.split(".")
  cents = right.ljust(2, "0")
  "$ #{dollars}.#{cents}"
end

SCHEDULER.every '90m', first_in: 0 do |job|
  tx = []

  t.transactions.take(20).each do |t|
    tx << {
    label: t.description,
    value: dollars(t.amount),
    type: t.transaction_type
    }
  end
  send_event('transactions', items: tx )
end
