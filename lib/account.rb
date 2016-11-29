class Account

  attr_reader :balance, :transactions

  def initialize(balance=0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @transactions << {"date" => date, "deposit" => amount, "withdrawal" => 0, "balance" => @balance}
    amount
  end

  def withdraw(amount, date)
    @balance -= amount
    @transactions << {"date" => date, "deposit" => 0, "withdrawal" => amount, "balance" => @balance}
    amount
  end

  def print_balance
    @transactions.each do |hash|
      hash.each do |date, cred, deb, bal|
        puts "Date: #{date}, #{cred}, #{deb}, #{bal}"
      end
    end
  end

end
