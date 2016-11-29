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
    puts "Transactions".center(50)
    @transactions.each do |hash|
      puts "-----------------".center(50)
        hash.each do |k, v|
        puts "#{k}: #{v}".center(50)
      end
    end
  end

end
