require 'minty'
require 'minty/utils'

@creds = Minty::Credentials.load

def dollars(value)
  dollars, right = value.to_f.to_s.split(".")
  cents = right.ljust(2, "0")
  "$ #{dollars}.#{cents}"
end

def accounts(&blk)
  t = Minty::Client.new(@creds)
  result = t.accounts
            .reject { |a| excluded_account_types.include? a.type }
            .sort_by { |a| a.send(sort_column) }
  result.each(&blk) if block_given?
  result
end

def total_value
  t = Minty::Client.new(@creds)
  t.accounts.map(&:value).inject(0, :+)
end

def sort_column
  :value
end

def excluded_account_types
  excluded =  "invest"
end

SCHEDULER.every '90m', first_in: 0 do |job|
  tx = []
  ac = []

  t = Minty::Client.new(@creds)
  t.refresh

  t.transactions.take(20).each do |t|
    t.description.slice! "Tangerine "
    t.description.slice! "Account "
    t.description.slice! "- A New Hope"
    t.description.slice! "- Rent Pool"
    t.description.gsub!("Withdrawl", "WD")
    t.description.gsub!("Transaction", "TX")
    t.description.gsub!("Chequing", "Chq.")
    t.description.gsub!("Savings", "Svgs.")

    tx << {
    label: t.description[0..20],
    value: dollars(t.amount),
    type: t.transaction_type
    }
  end

  accounts do |a|
    a.name.gsub!("Chequing", "Chq.")
    a.name.gsub!("Savings", "Svgs.")

    ac << {
      label: a.name[0..20],
      type: a.type.capitalize,
      value: dollars(a.value)
    }
  end
  ac << {
    label: "|",
    type: "",
    value: "|"
  }
  ac << {
    label: "Total:",
    type: "- all -",
    value: dollars(total_value)
  }
  send_event('transactions', items: tx )
  send_event('accounts', items: ac)
end
